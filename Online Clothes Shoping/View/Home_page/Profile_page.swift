import SwiftUI

struct MyAccountView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer() // Spacer to center content vertically
            
            Text("My Account")
                .font(.custom("Lora", size: 24))
                .foregroundColor(Color.black)
            Spacer()
            HStack {
                Spacer()
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle()) // Display image in a circular shape
                    .overlay(Circle().stroke(Color.white, lineWidth: 2)) // Add a border around the circular image
                    .shadow(radius: 10) // Add shadow to the circular image
                                Spacer()
            }
            Spacer()
            
            IconTextRow(icon: "order", text: "Personal Information")
            IconTextRow(icon: "order", text: "Order")
            IconTextRow(icon: "order", text: "Privacy Policy")
            IconTextRow(icon: "order", text: "Language and Location")
            
            Spacer()
            
            Button(action: {
                // Action for logout button
                // Add your logout logic here
            }) {
                Text("Logout")
                    .font(.custom("Lora", size: 20))
                    .foregroundColor(Color.red) // Change the color as needed
                    .padding()
                    .background(Color.white.opacity(0.2)) // Background color with opacity
                    .cornerRadius(10) // Rounded corners
            }
            
            Spacer() // Spacer to push the logout button to the bottom
        }
        .padding(20)
    }
}

struct IconTextRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 17))
                .foregroundColor(Color.black)
                .frame(width: 30, height: 30)
            
            Text(text)
                .font(.custom("Lora", size: 17))
                .foregroundColor(Color.black)
           Spacer()
            
            if icon == "order" {
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.black)
            }
        }
        .padding(.vertical, 5)
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView()
    }
}
