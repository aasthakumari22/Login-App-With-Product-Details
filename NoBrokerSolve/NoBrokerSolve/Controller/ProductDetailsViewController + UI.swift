//
//  ProductDetailsViewController + UI.swift
//  NoBrokerSolve
//
//  Created by Aastha Kumari on 06/01/24.
//

import UIKit

extension ProductDetailsViewController {
    func setupLayout() {
        view.addSubview(imageViewLabel)
        view.addSubview(idLabel)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(discountPercentageLabel)
        view.addSubview(ratingLabel)
        view.addSubview(stockLabel)
        view.addSubview(brandLabel)
        view.addSubview(categoryLabel)
        view.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            imageViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageViewLabel.widthAnchor.constraint(equalToConstant: 40),
            imageViewLabel.heightAnchor.constraint(equalToConstant: 200),
            
            idLabel.topAnchor.constraint(equalTo: imageViewLabel.bottomAnchor, constant: 5),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            idLabel.widthAnchor.constraint(equalToConstant: 50),
            idLabel.heightAnchor.constraint(equalToConstant: 40),
            
            
            titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.widthAnchor.constraint(equalToConstant: 50),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 100),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 80),
            
            
            discountPercentageLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            discountPercentageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            discountPercentageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            discountPercentageLabel.widthAnchor.constraint(equalToConstant: 50),
            discountPercentageLabel.heightAnchor.constraint(equalToConstant: 40),
            
            ratingLabel.topAnchor.constraint(equalTo: discountPercentageLabel.bottomAnchor, constant: 5),
            ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ratingLabel.widthAnchor.constraint(equalToConstant: 50),
            ratingLabel.heightAnchor.constraint(equalToConstant: 40),
            
            stockLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 5),
            stockLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stockLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stockLabel.widthAnchor.constraint(equalToConstant: 50),
            stockLabel.heightAnchor.constraint(equalToConstant: 40),
            
            brandLabel.topAnchor.constraint(equalTo: stockLabel.bottomAnchor, constant: 5),
            brandLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            brandLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            brandLabel.widthAnchor.constraint(equalToConstant: 50),
            brandLabel.heightAnchor.constraint(equalToConstant: 40),
            
            categoryLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 5),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            categoryLabel.widthAnchor.constraint(equalToConstant: 50),
            categoryLabel.heightAnchor.constraint(equalToConstant: 40),
            
            priceLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            priceLabel.widthAnchor.constraint(equalToConstant: 50),
            priceLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }
}
