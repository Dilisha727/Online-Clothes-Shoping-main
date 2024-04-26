//
//  WelcomePage.swift
//  Online Clothes Shopping
//
//  Created by NIBM on 2024-03-25.

import SwiftUI
import Foundation

struct UserLoginView: View {
    @State private var email = UserDefaults.standard.string(forKey: "savedEmail") ?? ""
    @State private var password = UserDefaults.standard.string(forKey: "savedPassword") ?? ""
    @State private var navigateToHome = false

    var body: some View {
        ZStack {
            Image("login")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 24) {
                Spacer()
                
                Text("Welcome Back \n GlamFrame")
                    .font(Font.custom("Georgia", size: 32))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(width: 335, height: 36)
                    .padding(.bottom,70)
                VStack{
                    
                    Text("Please log in to continue Shopping")
                        .font(Font.custom("Georgia", size: 16))
                        .foregroundColor(.white)
                        .frame(width: 335, height: 22)
                        .padding(.bottom,40)
                    
                    
                    TextField("Enter your email", text: $email)
                        .font(Font.custom("Lora", size: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center) // Align center horizontally
                        .frame(width: 320, height: 22)
                        .background(Color.gray.opacity(0.9))
                        .padding(.bottom,20)
                    
                    SecureField("Enter your password", text: $password)
                        .font(Font.custom("Lora", size: 16))
                        .foregroundColor(.black)
                        .padding(.top, 8.0)
                        .multilineTextAlignment(.center) // Align center horizontally
                        .frame(width: 320, height: 22)
                        .background(Color.black)
                        .padding(.bottom,20)
                    
                    HStack {
                        Spacer()
                        Text("Forget password")
                            //.font(Font.custom("Nunito", size: 16))
                            //.foregroundColor(Color(hex: "78F208"))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .padding(.bottom,10)
                    }
                    .frame(width: 335, height: 16)
                
                Button(action: {
                    // Perform login action
                    let userLogin = UserLogin(email: email, password: password)
                    UserLoginService().loginUser(userLogin: userLogin) { success, message in
                        if success {
                            print("Login successful")
                            self.navigateToHome = true
                            
                            // Save email and password to UserDefaults
                            UserDefaults.standard.set(email, forKey: "savedEmail")
                            UserDefaults.standard.set(password, forKey: "savedPassword")
                        } else {
                            print("Login failed: \(message)")
                        }
                    }
                }) {
                    Text("Login")
                        .font(Font.custom("Nunito", size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .frame(width: 335, height: 50)
                        //.background(Color(hex: "78F208"))
                        .cornerRadius(25)
                        .background(Color.blue)
                }
                .fullScreenCover(isPresented: $navigateToHome) {
                    Home_page()
                
                }
                .padding(.bottom,30)
                .cornerRadius(25)
                
                HStack {
                    Spacer()
                    Text("Don't Have an account?")
                        .font(Font.custom("Nunito", size: 16))
                        .foregroundColor(.white)
                    NavigationLink(destination: UserRegistrationView()) {
                        Text("SignUp")
                            .font(Font.custom("Nunito", size: 18))
                            .fontWeight(.medium)
                           // .foregroundColor(Color(hex: "78F208"))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
            }.padding()
                    .frame(width: 350, height: 400)
                    .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(
                                            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.2), Color.white.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.black, lineWidth: 1)
                                        )
                                        .cornerRadius(12)
                                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                                )
                          
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black, width: 1)
                .padding(.top,20)
            
        }
        .onAppear {
            // Display saved email and password when the view appears
            email = UserDefaults.standard.string(forKey: "savedEmail") ?? ""
            password = UserDefaults.standard.string(forKey: "savedPassword") ?? ""
        }
    }
}

struct UserLoginView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginView()
    }
}
/*
import SwiftUI
import Foundation

struct UserLoginView: View {
    @State private var email = UserDefaults.standard.string(forKey: "savedEmail") ?? ""
    @State private var password = UserDefaults.standard.string(forKey: "savedPassword") ?? ""
    @State private var navigateToHome = false
    @State private var isPasswordVisible = false

    var body: some View {
        ZStack {
            Image("login")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 24) {
                Spacer()
                
                Text("Welcome Back \n GlamFrame")
                    .font(Font.custom("Georgia", size: 32))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(width: 335, height: 36)
                
                Text("Please log in to continue Shopping")
                    .font(Font.custom("Georgia", size: 16))
                    .foregroundColor(.white)
                    .frame(width: 335, height: 22)
               
                
                TextField("Enter your email", text: $email)
                    .font(Font.custom("Lora", size: 16))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading) // Align left horizontally
                      
                    .multilineTextAlignment(.center) // Align center horizontally
                    .frame(width: 320, height: 22)
                    .background(Color.gray.opacity(0.9))
                    .padding(.trailing, 40)
                HStack {
                    if isPasswordVisible {
                        TextField("Enter your password", text: $password)
                            .font(Font.custom("Lora", size: 16))
                            .foregroundColor(.black)
                            .padding(.top, 8.0)
                            .multilineTextAlignment(.center) // Align center horizontally
                            .frame(width: 320, height: 22)
                            .background(Color.black)
                    } else {
                        SecureField("Enter your password", text: $password)
                            .font(Font.custom("Lora", size: 16))
                            .foregroundColor(.black)
                            .padding(.top, 8.0)
                           // .multilineTextAlignment(.center) // Align center horizontally
                            .frame(width: 320, height: 22)
                            //.background(Color.black)
                    }

                    // Eye icon button to toggle password visibility
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.white)
                            .padding(.trailing, 12)
                    }
                    
                    
                }.frame(width: 320, height: 22)
                
          
                HStack {
                    Spacer()
                    Text("Forget password")
                        .font(Font.custom("Nunito", size: 16))
                        .foregroundColor(Color(hex: "78F208"))
                }
                .frame(width: 335, height: 16)
                
                Button(action: {
                    // Perform login action
                    let userLogin = UserLogin(email: email, password: password)
                    UserLoginService().loginUser(userLogin: userLogin) { success, message in
                        if success {
                            print("Login successful")
                            self.navigateToHome = true
                            
                            // Save email and password to UserDefaults
                            UserDefaults.standard.set(email, forKey: "savedEmail")
                            UserDefaults.standard.set(password, forKey: "savedPassword")
                        } else {
                            print("Login failed: \(message)")
                        }
                    }
                }) {
                    Text("Login")
                        .font(Font.custom("Nunito", size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .frame(width: 335, height: 50)
                        .background(Color(hex: "78F208"))
                        .cornerRadius(25)
                }
                .fullScreenCover(isPresented: $navigateToHome) {
                    Home_page()
                }
                
                HStack {
                    Spacer()
                    Text("Don't Have an account?")
                        .font(Font.custom("Nunito", size: 16))
                        .foregroundColor(.white)
                    NavigationLink(destination: UserRegistrationView()) {
                        Text("SignUp")
                            .font(Font.custom("Nunito", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(Color(hex: "78F208"))
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .border(Color.black, width: 1)
        }
        .onAppear {
            // Display saved email and password when the view appears
            email = UserDefaults.standard.string(forKey: "savedEmail") ?? ""
            password = UserDefaults.standard.string(forKey: "savedPassword") ?? ""
        }
    }
}

struct UserLoginView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginView()
    }
}
*/
