//
//  Shipping Address.swift
//  Online Clothes Shoping
//
//  Created by Dilisha priyashan on 2024-04-22.
//

import SwiftUI


struct ShippingAddressView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var Zip: String = ""

    
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                TextField("First Name", text: $firstName)
                    .frame(width: 150, height: 30)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    
                
                
                TextField("Last Name", text: $lastName)
                    .overlay(Rectangle().frame(width: 150, height: 1).foregroundColor(.black).offset(x: 174, y: 0))
                    .frame(width: 150, height: 30)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
           
            
            TextField("Address", text: $address)
                .overlay(Rectangle().frame(width: 150, height: 1).foregroundColor(.black).offset(x: 0, y: 14))
                .frame(width: 340, height: 30)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            TextField("City", text: $city)
                .overlay(Rectangle().frame(width: 150, height: 1).foregroundColor(.black).offset(x: 0, y: 140))
                .frame(width: 340, height: 30)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
           
            HStack{
                TextField("Zip code", text: $Zip)
                    .frame(width: 150, height: 30)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    
                
                
                TextField("State", text: $state)
                    .overlay(Rectangle().frame(width: 150, height: 1).foregroundColor(.black).offset(x: 174, y: 0))
                    .frame(width: 150, height: 30)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            Spacer()
            Button(action: {
                // Add action for payment
            }) {
                Text("Add address")
                    .foregroundColor(.black)
                    .font(Font.custom("Nunito", size: 18))
                    .fontWeight(.medium)
                    .frame(width: 335, height: 50)
                    .background(Color(hex: "78F208")) // Button color: 78F208
                    .cornerRadius(25)
                    .padding([.top, .leading, .bottom], 20)
            }
            .padding(.bottom, 50)
            .frame(width: 360, height: 100)
        }
        .padding()
        .navigationBarTitle("Edit Shipping Address")
    }
}

struct ShippingAddressView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingAddressView()
    }
}
