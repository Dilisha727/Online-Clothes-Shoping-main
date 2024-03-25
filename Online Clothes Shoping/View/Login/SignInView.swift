//
//  Register.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    var body: some View {
        ZStack {
            
            
            VStack {
                //TextField(title: "Email", text:  $viewModel.phoneNumber)
                
                
                LineTextField(title: "Email",placholder: "Enter your email address", txt: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                LineTextField(title: "Phone Number",placholder: "Enter your Phone Number", txt: $viewModel.phoneNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                LineTextField(title: "Password",placholder: "Enter your ConformPassword", txt: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                LineTextField(title: "Conform Password",placholder: "Enter your Phone Number", txt: $viewModel.phoneNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                NavigationLink {
                    Home_page()
                } label: {
                    RoundButton(title: "Home_page") {
                    }
                }
                
                Button(action: {
                    Home_page()
                }) {
                    Text("Register")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                
                .padding()
                
                switch viewModel.registrationStatus {
                case .loading:
                    ProgressView()
                case .success:
                    Text("Registration successful!")
                case .failure(let errorMessage):
                    Text(errorMessage)
                        .foregroundColor(.red)
                default:
                    EmptyView()
                }
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
            
        }
        
    }
    
    
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            
            NavigationView {
                SignInView()
            }
            
        }
    }
}
