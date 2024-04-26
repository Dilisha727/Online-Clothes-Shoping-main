//
//  CardView.swift
//  Online Clothes Shoping
//
//  Created by NIBM-LAB04-PC04 on 2024-03-26.
//
//


import SwiftUI
import SDWebImageSwiftUI

struct Cart: View {
    @State var subTotal = 0.0
    @State var shipping = 0.0
    @State var totalWithShipping = 0.0
    @State var isCheckoutActive = false // State for navigation

    var body: some View {
        VStack {
            Spacer()
            Text("Cart")
                .font(.system(size: 44))
                .fontWeight(.bold)
                //.frame(width: 360, alignment: .leading)
                //.frame(maxWidth: .infinity, alignment: .leading) 
                .padding(.top)
            Spacer()
                
        }

        NavigationView {
            List {
                ForEach(cartItems.indices, id: \.self) { index in
                    CartItemView(item: cartItems[index], calculateTotal: calculateTotalPrice)
                }
                .onDelete(perform: deleteItem)
                
            }
        }
        .frame(width: 360, height: 330) // Modify frame width and height here

        Divider()

        VStack {
            HStack {
                Text("Sub total")
                Spacer()
                Text("LKR \(String(format: "%.2f", subTotal))")
            }.padding()

            HStack {
                Text("Shipping")
                Spacer()
                Text("LKR \(String(format: "%.2f", shipping))")
            }.padding()

            HStack {
                Text("Total")
                    .font(.title2)
                    .fontWeight(.bold)
                    .font(.system(size: 44, design: .rounded))
                Spacer()
                Text("LKR \(String(format: "%.2f", totalWithShipping))")
                    .font(.title)
                    .fontWeight(.bold)
                    .font(.system(size: 44, design: .rounded))
                    .foregroundColor(.red)
            }.padding()

            // Checkout button
            Button(action: {
                isCheckoutActive = true // Activate navigation
            }) {
                Text("Checkout")
                    .foregroundColor(.black)
                    .font(Font.custom("Nunito", size: 18))
                    .fontWeight(.medium)
                    .frame(width: 335, height: 50)
                    .background(Color.blue) 
                    .cornerRadius(25)
                    .padding([.top, .leading, .bottom], 20)
                    //.padding(.vertical, 50) // Increased vertical padding to move the button further up
                           
            }
            .padding(.bottom, 50)
            .sheet(isPresented: $isCheckoutActive) {
                CheckoutView() // Navigate to Checkout page
                  // .padding(.vertical, 70) // Increased vertical padding to move the button further up
                           
            }
        }
        .padding(.bottom, 50)
        .frame(width: 360, height: 400)
        .onAppear(perform: calculateTotalPrice)
    }

    func calculateTotalPrice() {
        subTotal = cartItems.reduce(0.0) { $0 + ($1.price * Double($1.quantity)) }
        shipping = subTotal > 0 ? 300.0 : 0.0
        totalWithShipping = subTotal + shipping
    }

    func deleteItem(at offsets: IndexSet) {
        cartItems.remove(atOffsets: offsets)
        calculateTotalPrice()
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}

struct CartItemView: View {
    @State private var quantity = 1
    let item: CartItem
    let calculateTotal: () -> Void // Closure to calculate total

    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: item.imageURL))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 60)

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Price: \(String(format: "%.2f", item.price))")
                
                // Quantity adjustment buttons
                HStack {
                    Button(action: {
                        decreaseQuantity()
                        calculateTotal() // Update total when quantity decreases
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.red)
                    }
                    Text("\(quantity)")
                    Button(action: {
                        increaseQuantity()
                        calculateTotal() // Update total when quantity increases
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                    }
                }

                Text("Size: \(item.size)")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 8)
            .background(Color.white)

            Button(action: {
                // Remove item action here
                if let index = cartItems.firstIndex(where: { $0.cartId == item.cartId }) {
                    cartItems[index].quantity = quantity // Update quantity in the cart
                    calculateTotal() // Update total when quantity changes
                }
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .background(Color.white)
        .padding(.vertical, 5)
    }

    func decreaseQuantity() {
        if quantity > 1 {
            quantity -= 1
        }
    }

    func increaseQuantity() {
        quantity += 1
    }
}


