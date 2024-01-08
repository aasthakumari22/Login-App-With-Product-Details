//
//  ProductViewVM.swift
//  NoBrokerSolve
//
//  Created by Aastha Kumari on 06/01/24.
//

import Foundation

class ProductViewVM {
    
    func fetchData(onCompletion: @escaping (ModelData) -> Void) {
        if let url = URL(string: "https://dummyjson.com/products?limit=30&skip=0") {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Got error while fetching the data.")
                    return
                }
                do {
                    let decodedData = try JSONDecoder().decode(ModelData.self, from: data)
                    onCompletion(decodedData)
                } catch {
                    print(error.localizedDescription)
                }
                
            }
            task.resume()
        }
    }
    
    func fetchProductData(onCompletion: @escaping (ModelData) -> Void, query: String) {
        
        if let url = URL(string: "https://dummyjson.com/products/search?q=\(query)") {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Got error while fetching the data.")
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(ModelData.self, from: data)
                    onCompletion(decodedData)
                } catch {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    }
}
