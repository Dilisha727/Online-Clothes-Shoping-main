//
//  UiExtention.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//


import SwiftUI


struct ShowButton: ViewModifier {
    @Binding var isShow: Bool
    
    public func body(content: Content) -> some View {
        
        HStack {
            content
            Button {
                isShow.toggle()
            } label: {
                Image(systemName: !isShow ? "eye.fill" : "eye.slash.fill" )
                    .foregroundColor(.blue)
            }

        }
    }
}

