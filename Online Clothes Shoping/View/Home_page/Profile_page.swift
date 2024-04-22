/*import SwiftUI

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
 }*/
//final
/*import SwiftUI

class AuthManager: ObservableObject {
    static let shared = AuthManager()
    
    @Published var isLoggedIn = false // Example state to track login status
    
    func logout() {
        // Implement your logout logic here, such as clearing tokens or resetting state
        isLoggedIn = false // Example: Set isLoggedIn to false after logout
    }
}

struct MyAccountView: View {
    @ObservedObject var authManager = AuthManager.shared
    @State private var shouldNavigateToWelcome = false // State to control navigation
    
    var body: some View {
        NavigationView {
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
                    authManager.logout() // Call logout method from AuthManager
                    shouldNavigateToWelcome = true // Set navigation flag to true
                }) {
                    Text("Logout")
                        .font(.custom("Lora", size: 20))
                        .foregroundColor(Color.red) // Change the color as needed
                        .padding()
                        .background(Color.white.opacity(0.2)) // Background color with opacity
                        .cornerRadius(10) // Rounded corners
                }
                .fullScreenCover(isPresented: $shouldNavigateToWelcome, content: {
                    Welcom_page() // Navigate to WelcomePage when shouldNavigateToWelcome is true
                })
                
                Spacer() // Spacer to push the logout button to the bottom
            }
            .padding(20)
            .navigationTitle("My Account") // Set navigation title
        }
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

struct WelcomePage: View {
    var body: some View {
        Text("Welcome Page")
            .font(.title)
            .padding()
    }
 }*/
import SwiftUI

class AuthManager: ObservableObject {
    static let shared = AuthManager()
    
    @Published var isLoggedIn = false // Example state to track login status
    
    func logout() {
        // Implement your logout logic here, such as clearing tokens or resetting state
        isLoggedIn = false // Example: Set isLoggedIn to false after logout
        
        
    }
}

struct MyAccountView: View {
    @ObservedObject var authManager = AuthManager.shared
    @State private var shouldNavigateToWelcome = false // State to control navigation
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Spacer() // Spacer to center content vertically
                
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
                
                NavigationLink(destination: UserDetailsView()) {
                                   IconTextRow(icon: "order", text: "Personal Information")
                               }
                IconTextRow(icon: "order", text: "Order")
                IconTextRow(icon: "order", text: "Privacy Policy")
                IconTextRow(icon: "order", text: "Language and Location")
                
                Spacer()
                
                Button(action: {
                    authManager.logout() // Call logout method from AuthManager
                    shouldNavigateToWelcome = true // Set navigation flag to true
                }) {
                    Text("Logout")
                        .font(.custom("Lora", size: 20))
                        .foregroundColor(Color.red) // Change the color as needed
                        .padding()
                        .background(Color.white.opacity(0.2)) // Background color with opacity
                        .cornerRadius(10) // Rounded corners
                }
                .fullScreenCover(isPresented: $shouldNavigateToWelcome, content: {
                    Welcom_page() // Navigate to WelcomePage when shouldNavigateToWelcome is true
                })
                
                Spacer() // Spacer to push the logout button to the bottom
            }
            .padding(20)
            .navigationTitle("My Account") // Set navigation title
        }
        .onDisappear {
            // Handle app restart here
            if authManager.isLoggedIn == false {
                // This closure will be called when the view disappears, such as after logout
                // You can add code here to perform actions needed for app restart
                // For example, you might want to reset the app state or navigate to the initial view
            }
        }
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

struct WelcomePage: View {
    var body: some View {
        Text("Welcome Page")
            .font(.title)
            .padding()
    }
}
