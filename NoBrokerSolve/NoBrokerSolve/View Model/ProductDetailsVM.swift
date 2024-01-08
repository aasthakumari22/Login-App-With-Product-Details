//
//  ProductDetailsVM.swift
//  NoBrokerSolve
//
//  Created by Aastha Kumari on 06/01/24.
//

import UIKit

class ProductDetailsVM {
    
    var selectIndex: Int
    var modelData: Products
    var onImageCompletion: ((UIImage)->Void)?
    
    init(modelData: Products, selectIndex: Int) {
        self.modelData = modelData
        self.selectIndex = selectIndex
        loadImage()
    }
    
    private func loadImage() {
        DispatchQueue.global().async {
            if let productURL = self.modelData.productURL,
               let imageData = try? Data(contentsOf: productURL),
               let productImage = UIImage(data: imageData) {
                self.onImageCompletion?(productImage)
            }
        }
        
    }
    
    var idLabel: String {
        return "ID: \(modelData.id)"
    }
    var titleLabel: String {
        return "Title: \(modelData.title)"
    }
    var descriptionLabel: String {
        return "Description: \(modelData.description)"
    }
    var priceLabel: String {
        return "Price: \(modelData.price)"
    }
    var discountPercentageLabel: String {
        return "DiscountPercentage: \(modelData.discountPercentage)"
    }
    var ratingLabel: String {
        return "Rating: \(modelData.rating)"
    }
    var stockLabel: String {
        return "Stock: \(modelData.stock)"
    }
    var brandLabel: String {
        return "Brand: \(modelData.brand)"
    }
    var categoryLabel: String {
        return "Category: \(modelData.category)"
    }
    
    
    func fetchProductDetails(onCompletion: @escaping (Products) -> Void, id: Int) {
        
        if let url = URL(string: "https://dummyjson.com/products/\(id)") {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Got error while fetching the data.")
                    return
                }
                do {
                    let decodedData = try JSONDecoder().decode(Products.self, from: data)
                    onCompletion(decodedData)
                } catch {
                    print("ERROR: \(error.localizedDescription)")
                }
                
            }
            task.resume()
        }
        
    }
}
