//
//  ModelData.swift
//  NoBrokerSolve
//
//  Created by Aastha Kumari on 06/01/24.
//

import Foundation

struct ModelData: Decodable {
    let products: [Products]
}

struct Products: Decodable {
    var id: Int
    var title: String
    var description: String
    var price: Int
    var discountPercentage: Float
    var rating: Float
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
    var images: [String]
    
    var productURL: URL? {
        return URL(string: "https://i.dummyjson.com/data/products/\(id)/thumbnail.jpg")
    }
}
