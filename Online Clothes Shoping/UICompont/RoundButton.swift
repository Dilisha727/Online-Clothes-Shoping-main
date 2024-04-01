//
//  RoundButton.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//


import SwiftUI

struct RoundButton: View {
    var title:String
    @Binding var selected:String
    var animation: Namespace.ID
    
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){selected = title}
            print(title)
        }){
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .foregroundColor(selected == title ? .white : .black)
                .padding(.vertical,10)
                .padding(.horizontal,selected == title ? 20 : 0)
                .background(//slide
                    ZStack{
                        if selected == title{
                            Color.black
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
                
        }
    }
}




