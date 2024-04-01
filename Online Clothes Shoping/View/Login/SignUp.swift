import SwiftUI

struct UserRegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var address = ""

    var body: some View {
        ZStack{
            Image("Register")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Welcome Back")
                    .font(.custom("Lora-Medium", size: 32))
                    .foregroundColor(.white)
                    .frame(width: 335, height: 36)
                
                Text("Please log in to continue shopping")
                    .font(.custom("Nunito-Medium", size: 16))
                    .foregroundColor(.white)
                    .frame(width: 335, height: 22)
                    .padding(.top, 48)
                
                TextField("Email", text: $email)
                    .font(.custom("Lora-Medium", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 335)
                    .background(.opacity(0.9))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                SecureField("Password", text: $password)
                    .font(.custom("Lora-Medium", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 335)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .font(.custom("Lora-Medium", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 335)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Full Name", text: $fullName)
                    .font(.custom("Lora-Medium", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 335)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Phone Number", text: $phoneNumber)
                    .font(.custom("Lora-Medium", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 335)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Address", text: $address)
                    .font(.custom("Lora-Medium", size: 16))
                    .foregroundColor(.black)
                    .frame(width: 335)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    // Perform registration action
                }) {
                    Text("Register")
                        .font(.custom("Lora-Medium", size: 16))
                        .foregroundColor(.black)
                        .frame(width: 335, height: 50)
                        .background(Color(hex: "78F208"))
                        .cornerRadius(8)
                }
                
                HStack(spacing: 20) {
                    Image("facebook_icon")
                                .resizable()
                                .frame(width: 50, height: 50)// Replace with actual Facebook icon image
                    Image("google_icon")
                        . resizable()
                        .frame(width: 50, height: 50)// Replace with actual Google icon image
                    Image("apple_icon")
                        .resizable()
                        .frame(width: 50, height: 50)// Replace with actual Apple icon image
                }
                .padding(.top, 10)
                
                Text("Already have an account?")
                    .font(.custom("Nunito-Medium", size: 16))
                    .foregroundColor(.white)
                
                Button(action: {
                    // Navigate to login screen
                }) {
                    Text("Sign In")
                        .font(.custom("Nunito-Medium", size: 16))
                        .foregroundColor(Color(hex: "78F208"))
                }
                .frame(width: 335, height: 16)
                .padding(.top, 4)
            }
            .padding(.horizontal)
        }
    }
}

struct UserRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationView()
    }
}
