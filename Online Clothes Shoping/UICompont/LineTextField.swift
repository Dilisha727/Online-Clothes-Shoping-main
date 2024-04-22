//
//  LineTextField.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//
/*
struct LineTextField: View {
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var text: String
    @State var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        ZStack{
            Image("Register")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
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
*/
import SwiftUI

struct UserRegistrationView1: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var address = ""

    var body: some View {
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            SecureField("Confirm Password", text: $confirmPassword)
            TextField("Full Name", text: $fullName)
            TextField("Phone Number", text: $phoneNumber)
            TextField("Address", text: $address)
            
            Button("Register") {
                let userRegistration = UserRegistration(email: email, password: password, fullName: fullName, phoneNumber: phoneNumber, address: address, confirmPassword: confirmPassword)
                
                UserRegistrationService().registerUser(userRegistration: userRegistration) { success, message in
                    if success {
                        print("Registration successful")
                    } else {
                        print("Registration failed: \(message)")
                    }
                }
            }
        }
    }
}

struct UserRegistrationView1_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationView()
    }
}
