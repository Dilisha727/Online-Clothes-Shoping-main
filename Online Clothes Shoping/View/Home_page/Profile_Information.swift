import SwiftUI

struct UserDetailsView: View {
    @StateObject var userViewModel = UserViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Details")) {
                    TextField("Email", text: $userViewModel.user.email)
                        .disabled(true)
                    TextField("Full Name", text: $userViewModel.user.fullName)
                        .disabled(true)
                    TextField("Phone Number", text: $userViewModel.user.phoneNumber)
                        .disabled(true)
                    TextField("Address", text: $userViewModel.user.address)
                        .disabled(true)
                }
            }
            .navigationBarTitle("User Profile")
        }
    }
}

class UserViewModel: ObservableObject {
    @Published var user: MyUser

    init() {
        // Initialize with dummy data or fetch user data from API/database
        self.user = MyUser(email: "user@example.com", password: "", fullName: "John Doe", phoneNumber: "123-456-7890", address: "123 Street, City")
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView()
    }
}

struct MyUser: Codable, Equatable {
    var email: String
    let password: String
    var fullName: String
    var phoneNumber: String
    var address: String
    let confirmPassword: String  // Used locally for validation, not part of the API request/response

    enum CodingKeys: String, CodingKey {
        case email, password, fullName, phoneNumber, address, confirmPassword
    }

    init(email: String, password: String, fullName: String, phoneNumber: String, address: String, confirmPassword: String = "") {
        self.email = email
        self.password = password
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.address = address
        self.confirmPassword = confirmPassword
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decode(String.self, forKey: .email)
        password = try container.decode(String.self, forKey: .password)
        fullName = try container.decode(String.self, forKey: .fullName)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        address = try container.decode(String.self, forKey: .address)
        confirmPassword = try container.decode(String.self, forKey: .confirmPassword)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(fullName, forKey: .fullName)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(address, forKey: .address)
        try container.encode(confirmPassword, forKey: .confirmPassword)
    }
}
