//
//  navigation.swift
//  Online Clothes Shoping
//
//  Created by Dilisha priyashan on 2024-03-29.
//


// BottomNavBarViewModel.swift

import SwiftUI

struct NavigationItem {
    let id = UUID()
    let title: String
    let imageName: String
    let destination: AnyView // Use AnyView to hold different view types

}

