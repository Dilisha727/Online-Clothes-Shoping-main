//
//  Product.swift
//  Online Clothes Shoping
//
//  Created by NIBM-LAB04-PC04 on 2024-03-26.
//


import Foundation

struct ProductResponse: Codable {
    let data: [Items]
    let message: String
}
// Model
struct Items: Codable, Identifiable {
    let id,price: Int
    let name, description, category: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, price, category, image
        
    }
}
