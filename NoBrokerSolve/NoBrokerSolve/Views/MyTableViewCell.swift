//
//  MyTableViewCell.swift
//  NoBrokerSolve
//
//  Created by Aastha Kumari on 06/01/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    var imageViewLabel: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    var descriptionLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLayout() {
        self.addSubview(imageViewLabel)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            imageViewLabel.topAnchor.constraint(equalTo: self.topAnchor),
            imageViewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageViewLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageViewLabel.widthAnchor.constraint(equalToConstant: 200),
            imageViewLabel.heightAnchor.constraint(equalToConstant: 230),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageViewLabel.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageViewLabel.trailingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ])
        
    }
    
    func configure(with product: Products){
        self.titleLabel.text = "Title: \(product.title)"
        self.descriptionLabel.text = "Description: \(product.description)"
        DispatchQueue.global().async {
            if let productURL = product.productURL, let url = URL(string: productURL.description) {
                let session = URLSession.shared
                let task = session.dataTask(with: url) { data, response, error in
                    if let imageData = data, let productImage = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self.imageViewLabel.image = productImage
                        }
                        
                    }
                }
                task.resume()
            }
        }
    }
    
}


