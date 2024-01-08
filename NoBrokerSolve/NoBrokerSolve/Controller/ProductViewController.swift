//
//  ProductViewController.swift
//  NoBrokerSolve
//
//  Created by Aastha Kumari on 06/01/24.
//

import UIKit

class ProductViewController: UIViewController {
    
    var productViewVM = ProductViewVM()
    
    var modelData: [Products] = [Products]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        return tableView
    }()
    
    var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search for product title"
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        searchTextField.delegate = self
        productViewVM.fetchData { product in
            self.modelData = product.products
        }
        setupLayout()
        
    }
    
    
}
extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        let product = modelData[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexValue = indexPath.row + 1
        let product = modelData[indexPath.row]
        let productDetailsVM = ProductDetailsVM(modelData: product, selectIndex: indexValue)
        let thirdVC = ProductDetailsViewController(productDetailsVM)
        
        navigationController?.pushViewController(thirdVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
extension ProductViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let query = textField.text!
        productViewVM.fetchProductData(onCompletion: { product in
            self.modelData = product.products
        }, query: query)
        searchTextField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
}
