//
//  ProductViewModel.swift
//  Online Clothes Shoping
//
//  Created by Dilisha priyashan on 2024-03-30.
//


import Foundation

import SwiftUI


class ProductViewModel : ObservableObject {
    
    @Published var productResults : [Items] = []
    
    let baseUrl = "https://ios-backend-gykn.onrender.com/products";
    
    init() {
        loadProducts()
    }
    
    func loadProducts() {
        guard let url = URL(string: baseUrl) else {return}
        
        URLSession(configuration: .default).dataTask(with:
                                                        URLRequest(url: url)) {data, response, error in
            
            guard let data = data else {return}
            
            do {
                print("start***************")
                let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                print("produt",productResponse)
                DispatchQueue.main.async {
                    self.productResults = productResponse.data
                }
                let productResults = productResponse.data
                print(productResults)
            }
            catch{
                print(error)
                print("Unable to decode the data!!")
            }
        }.resume()
    }
    
    
}



