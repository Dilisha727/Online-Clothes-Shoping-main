import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var quantity = 1 // Define quantity here
    @State var selectedSize: String = "M"
    @State var goTOCart = false
    let sizes = ["XS", "S", "M", "L", "XL"]
    @State private var showAlert = false
    let product: Items
    
    var body: some View {
        ZStack {
            Color(.white).edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
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
                        .padding()
                    DescriptionView(product: product, quantity: $quantity) // Pass quantity as a binding
                    
                    HStack {
                        Text("$\(product.price)")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            goTOCart = true
                            // Handle adding to cart here
                        }) {
                            Text("Add to Cart")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Primary"))
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .edgesIgnoringSafeArea(.bottom)
                }
                .padding(.top, 30)
                .padding(.bottom, 100)
            }
            //aditional
            
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text("LKR 4200")
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
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DescriptionView: View {
    let product: Items
    @Binding var quantity: Int // Receive quantity as a binding
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
           
            Text(product.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text(product.description)
                .opacity(0.6)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Size")
                        .fontWeight(.semibold)
                    HStack
                    {
                        Text("XL")
                            .opacity(0.6)
                        Text("XXl")
                            .opacity(0.6)
                        Text("M")
                            .opacity(0.6)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack {
                        ColorDotView(color: Color.red)
                        ColorDotView(color: Color.black)
                        ColorDotView(color: Color.blue) // Example colors
                    }
                }
            }
            .padding(.vertical, 10)
            
            HStack {
                Button(action: {
                    if quantity > 1 {
                        quantity -= 1
                    }
                }) {
                    Image(systemName: "minus")
                        .padding(.all, 8)
                        //.background(Color.black)
                        .clipShape(Circle())
                        .foregroundColor(.black)

                }
                Text("\(quantity)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                Button(action: {
                    quantity += 1
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .padding(.all, 8)
                       // .background(Color("Primary"))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(10)
        }
        .padding()
        .offset(y: -30)
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
