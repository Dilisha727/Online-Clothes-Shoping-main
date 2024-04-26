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
        VStack(spacing: 1) {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                Button {
                    show.toggle()
                } label: {
                    AnimatedImage(url: URL(string: product.image))
                        .resizable()
                        .frame(width: 160, height: 230)
                        .cornerRadius(15)
                }

                Button {
                    addToCart()
                } label: {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .padding(.all, 10)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .padding(.all, 20)
            }
            VStack(alignment: .leading) {
                Text(product.name)
                    .fontWeight(.medium)
                Text("LKR" + " " + String(product.price))
            }
        }
        .padding(.horizontal, 15)
        .sheet(isPresented: $show, content: {
            DetailView(product: product)
        })
    }

    func addToCart() {
        let cartItem = CartItem(cartId: UUID(), pid: product.id, name: product.name, price: Double(product.price), quantity: 1, imageURL: product.image, size: "M", eachPrice: "LKR \(String(format: "%.2f", product.price))")
        cartItems.append(cartItem)
    }
}
