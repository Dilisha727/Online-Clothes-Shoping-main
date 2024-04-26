//
//  Shipping Address.swift
//  Online Clothes Shoping
//
//  Created by Dilisha priyashan on 2024-04-10.
//
import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var quantity = 1
    @State var selectedSize: String = "M"
    @State var goTOCart = false
    @State private var showAlert = false
    let product: Items
    
    // Define sizes array here
    let sizes = ["XS", "S", "M", "L", "XL"]
    
    // Computed property for total price
    var totalPrice: Double {
        let quantityDouble = Double(quantity)
        return quantityDouble * Double(product.price)
    }
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    // Product Image
                    AnimatedImage(url: URL(string: product.image))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .cornerRadius(30)
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                    
                    // Description Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("LKR\(product.price)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        //Text("$\(product.price)")
                        Text("Description")
                            .fontWeight(.semibold)
                            .padding(.vertical, 8)
                        
                        Text(product.description)
                            .opacity(0.6)
                            .padding(.bottom, 0)
                        
                        // Size Selection
                     
                        Picker("Size", selection: $selectedSize) {
                            ForEach(sizes, id: \.self) { size in
                                Text(size)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        HStack{
                            // Color Selection
                            HStack(spacing: 20) {
                                ColorDotView(color: Color.red)
                                ColorDotView(color: Color.black)
                                ColorDotView(color: Color.blue)
                            }
                            .padding(.vertical, 10)
                            Spacer()
                            // Quantity Selection
                            QuantitySelection(quantity: $quantity)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Add to Cart Button
                    Button(action: {
                        goTOCart = true
                        let newItem = CartItem(cartId: UUID(), pid: product.id, name: product.name, price: Double(totalPrice), quantity: quantity, imageURL: product.image, size: selectedSize, eachPrice: "LKR \(String(format: "%.2f", totalPrice))")
                            
                        // Append the new item to the cartItems array
                        cartItems.append(newItem)
                        showAlert = true
                        print("appended")
                    }) {
                        //Text("$\(product.price)")
                        Text( "LKR.\(totalPrice, specifier: "%.2f")  Add to Cart")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 30)
                .padding(.bottom, 100)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {
            presentationMode.wrappedValue.dismiss()
        }))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Item Added"), message: Text("Item added to cart."), dismissButton: .default(Text("OK")))
        }
    }
}

struct QuantitySelection: View {
    @Binding var quantity: Int
    
    var body: some View {
        HStack {
            Button(action: {
                if quantity > 1 {
                    quantity -= 1
                }
            }) {
                Image(systemName: "minus")
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
            }
            
            Text("\(quantity)")
                .font(.title2)
                .fontWeight(.semibold)
            
            
            Button(action: {
                quantity += 1
            }) {
                Image(systemName: "plus")
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct ColorDotView: View {
    let color: Color
    
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct BackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = Items(id: 1, price: 188, name: "Sample Product", description: "Sample Description", category: "Sample Category", image: "sample_image")
        DetailView(product: sampleProduct)
    }
}



/*
//button
 HStack {
     Text("$\(product.price)")
         .font(.title)
         .foregroundColor(.black)
     Spacer()
     
     Text("Add to Cart")
         .font(Font.custom("Georgia", size: 32)) // Lora medium, size 32
         .fontWeight(.bold)
         .foregroundColor(.black)
         .multilineTextAlignment(.center)
         .cornerRadius(10.0)
         
     
 }
 .padding()
 .padding(.horizontal)
 .background(Color(hex: "78F208")) // Button color: 78F208
 .frame(maxHeight: .infinity, alignment: .bottom)
 .edgesIgnoringSafeArea(.bottom)
 //end adtional
 .edgesIgnoringSafeArea(.all)


//
 AnimatedImage(url: URL(string: product.image))
     .resizable()
     .aspectRatio(contentMode: .fit)
     .frame(height: 300)
     .clipped()
     .cornerRadius(30)
     .padding(.horizontal, 20)
 BackButton(action: {
     presentationMode.wrappedValue.dismiss()
 })
*/
