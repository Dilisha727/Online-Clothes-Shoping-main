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
                Text("Welcome To\nGlamFrame")
                    .font(Font.custom("Chalkduster", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                   // .frame(width: 335, height: 36)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    
                
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
                    .foregroundColor(.blue)
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
                    let userRegistration = UserRegistration(email: email, password: password, fullName: fullName, phoneNumber: phoneNumber, address: address, confirmPassword: confirmPassword)
                    
                    UserRegistrationService().registerUser(userRegistration: userRegistration) { success, message in
                        if success {
                            print("Registration successful")
                        } else {
                            print("Registration failed: \(message)")
                        }
                    }
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
                    // You can add code here to navigate to the login screen
                }) {
                    NavigationLink(destination: UserLoginView()) {
                        Text("Sign In")
                            .font(.custom("Nunito-Medium", size: 16))
                            .foregroundColor(Color(hex: "78F208"))
                    }
                    .buttonStyle(PlainButtonStyle()) // Add this line to style the navigation link as a button
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
 /*
 
 TextField("Email", text: $email)
     .font(.custom("Lora-Medium", size: 16))
     .frame(width: 335, height: 40)
     .background(Color.clear) // Set background color to clear (transparent)
     .foregroundColor(.white) // Set text color to white
     .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 1)) // Add white border
     
*/
