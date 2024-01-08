//
//  ProductDetailsViewController.swift
//  NoBrokerSolve
//
//  Created by Aastha Kumari on 06/01/24.
//


import UIKit

class ProductDetailsViewController: UIViewController {
    
    var productDetailsVM: ProductDetailsVM
    init(_ productDetailsVM: ProductDetailsVM){
        
        self.productDetailsVM = productDetailsVM
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var imageViewLabel: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var idLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    var descriptionLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    var priceLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    var discountPercentageLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    var ratingLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    var stockLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    var brandLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    var categoryLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        
        productDetailsVM.fetchProductDetails(onCompletion: { product in
            self.productDetailsVM.modelData = product
        }, id: productDetailsVM.selectIndex)
        
    }
    
    func configure() {
        self.idLabel.text = productDetailsVM.idLabel
        self.titleLabel.text = productDetailsVM.titleLabel
        self.descriptionLabel.text = productDetailsVM.descriptionLabel
        self.priceLabel.text = productDetailsVM.priceLabel
        self.discountPercentageLabel.text = productDetailsVM.discountPercentageLabel
        self.ratingLabel.text = productDetailsVM.ratingLabel
        self.stockLabel.text = productDetailsVM.stockLabel
        self.brandLabel.text = productDetailsVM.brandLabel
        self.categoryLabel.text = productDetailsVM.categoryLabel
        
        self.productDetailsVM.onImageCompletion = { [weak self] productImage in
            DispatchQueue.main.async {
                self?.imageViewLabel.image = productImage
            }
        }
    }
}

