/*import SwiftUI

struct Chat: View {
    @State private var email = ""
    @State private var password = ""
    @State private var navigateToHome = false
    
    var body: some View {
        ZStack {
            Image("Welcom Logo")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                
                
                /* Text("Please log in to continue Shopping")
                 .font(Font.custom("Nunito", size: 16))
                 .foregroundColor(.white)
                 .frame(width: 335, height: 22)
                 .offset(y: 48)*/
                
                
                TextField("Enter your email", text: $email)
                    .font(Font.custom("Georgia", size: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 151, height: 22)
                    .background(Color.red.opacity(0.5))
                    .cornerRadius(8)
                    .padding(.vertical, 10)
                
                SecureField("Enter your password", text: $password)
                    .font(Font.custom("Georgia", size: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 152, height: 22)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(8)
                    .padding(.vertical, 10)
                
                /*  HStack {
                 Spacer()
                 Text("Forget password")
                 .font(Font.custom("Nunito", size: 16))
                 .foregroundColor(.white)
                 .frame(width: 335, height: 16)
                 .offset(y: 49)
                 }
                 
                 Button(action: {
                 // Handle login action
                 }) {
                 Text("Login")
                 .font(Font.custom("Nunito", size: 16))
                 .fontWeight(.medium)
                 .foregroundColor(.white)
                 .frame(width: 335, height: 50)
                 .background(Color(hex: "78F208"))
                 .cornerRadius(25)
                 }
                 .offset(y: 164)
                 
                 HStack {
                 Text("Don't Have an account?")
                 .font(Font.custom("Nunito", size: 16))
                 .foregroundColor(.white)
                 NavigationLink(destination: Home_page()) {
                 Text("SignUp")
                 .font(Font.custom("Nunito", size: 16))
                 .fontWeight(.medium)
                 .foregroundColor(Color(hex: "78F208"))
                 }
                 }
                 .frame(width: 335, height: 16)
                 .offset(x: 20, y: 736)
                 
                 Spacer()
                 }*/
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
}
*/
