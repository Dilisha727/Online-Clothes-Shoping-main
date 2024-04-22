/*import SwiftUI

struct UserLoginView: View {
    @State private var email = ""
    @State private var password = ""
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
                
                Text("Please log in to continue Shopping")
                    .font(Font.custom("Georgia", size: 16))
                    .foregroundColor(.white)
                    .frame(width: 335, height: 22)
               
                
                TextField("Enter your email", text: $email)
                    .font(Font.custom("Lora", size: 16))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center) // Align center horizontally
                    .frame(width: 370, height: 22)
                    .background(Color.gray.opacity(0.9))
              
                SecureField("Enter your password", text: $password)
                    .font(Font.custom("Lora", size: 16))
                    .foregroundColor(.black)
                    .padding(.top, 8.0)
                    .multilineTextAlignment(.center) // Align center horizontally
                    .frame(width: 370, height: 22)
                    .background(Color.black)
                    //.presentationDragIndicator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
                   
                
                HStack {
                    Spacer()
                    Text("Forget password")
                        .font(Font.custom("Nunito", size: 16))
                        .foregroundColor(Color(hex: "78F208"))
                }
                .frame(width: 335, height: 16)
                .presentationDragIndicator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    // Perform login action
                    let userLogin = UserLogin(email: email, password: password)
                    UserLoginService().loginUser(userLogin: userLogin) { success, message in
                        if success {
                            print("Login successful")
                            self.navigateToHome = true
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
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
}

struct UserLoginView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginView()
    }
}
*/
//last

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
                
                Text("Please log in to continue Shopping")
                    .font(Font.custom("Georgia", size: 16))
                    .foregroundColor(.white)
                    .frame(width: 335, height: 22)
               
                
                TextField("Enter your email", text: $email)
                    .font(Font.custom("Lora", size: 16))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center) // Align center horizontally
                    .frame(width: 370, height: 22)
                    .background(Color.gray.opacity(0.9))
              
                SecureField("Enter your password", text: $password)
                    .font(Font.custom("Lora", size: 16))
                    .foregroundColor(.black)
                    .padding(.top, 8.0)
                    .multilineTextAlignment(.center) // Align center horizontally
                    .frame(width: 370, height: 22)
                    .background(Color.black)
                
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
