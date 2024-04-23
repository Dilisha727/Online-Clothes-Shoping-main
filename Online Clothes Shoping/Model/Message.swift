//
//  Message.swift
//  Online Clothes Shoping
//
//  Created by Dilisha priyashan on 2024-04-23.
//
import SwiftUI
import Foundation // Add this line to import Foundation

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let content: String
    let timestamp: Date
}

