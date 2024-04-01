import SwiftUI

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
                    .multilineTextAlignment(.center) // Align center horizontally
                    .frame(width: 370, height: 22)
                    .background(Color.gray.opacity(0.9))
                
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
        }
    }
}
