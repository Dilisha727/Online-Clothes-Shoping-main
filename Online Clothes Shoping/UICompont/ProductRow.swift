//
//  ProductRow.swift
//  Online Clothes Shoping
//
//  Created by NIBM-LAB04-PC04 on 2024-03-26.
//
import SwiftUI
import SDWebImageSwiftUI

struct ProductRow: View {
    
     @State var show = false
 let product: Items
 var body: some View {
     VStack(spacing: 1){
         ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
              
             Button {
                 show.toggle()
             } label: {
                 AnimatedImage(url: URL(string: product.image))
                     .resizable()
                     .frame(width: 160,height: 230)
                     .cornerRadius(15)
             }
             Button {
             } label: {
                                    
                 Image(systemName: "heart.fill")
                         .foregroundColor(.red)
                         .padding(.all,10)
                         .background(Color.white)
                         .clipShape(Circle())
             }
             .padding(.all,20)
         }
         Text(product.name)
             .fontWeight(.medium)
         Text("LKR" + " " + String(product.price))

         
             
     }.padding(.horizontal,15)
         .sheet(isPresented: $show, content: {
             
             DetailView(product: product)
         })

     
 }
}

struct UserRow_Previews: PreviewProvider {
 static var previews: some View {
     
     let sampleProduct = Items(id: 1, price: 188, name: "Sample Product", description: "Sample Description", category: "Sample Category", image: "sample_image")
     
     ProductRow(product: sampleProduct)
 }
}
