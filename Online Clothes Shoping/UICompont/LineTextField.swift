//
//  LineTextField.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import SwiftUI

struct LineTextField: View {
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var text: String
    @State var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        ZStack{
           
            
            
            VStack {
                Text(title)
                    .foregroundColor(.blue)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                
                TextField(placholder, text: $text)
                    .font(.custom("Lora-Medium", size: 20))
                    .frame(width: 335, height: 40)
                    .background(Color.clear) // Set background color to clear (transparent)
                    .foregroundColor(.white) // Set text color to white
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 1))
                Divider()
                
            }
         }
        }
    }

struct LineTextField_Previews: PreviewProvider {
    @State static  var txt: String = ""
    static var previews: some View {
        LineTextField(text: $txt)
            .padding(20)
    }
}


