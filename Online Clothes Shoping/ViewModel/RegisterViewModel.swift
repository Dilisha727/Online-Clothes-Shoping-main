//
//  RegisterViewModel.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var registrationStatus: RegistrationStatus = .idle

    private var cancellables: Set<AnyCancellable> = []

    enum RegistrationStatus {
        case idle
        case loading
        case success
        case failure(String)
    }

    func registerUser() {
        guard !phoneNumber.isEmpty, !email.isEmpty, !password.isEmpty else {
            registrationStatus = .failure("Please fill in all fields.")
            return
        }

        // Make API request to register user
        registrationStatus = .loading
        // Call your Node.js API to register the user
        // Example using URLSession or Alamofire
        // Replace "https://your-api-url/register" with your actual API endpoint

        let url = URL(string: "https://your-api-url/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let userData: [String: Any] = [
            "phoneNumber": phoneNumber,
            "email": email,
            "password": password
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: userData)

        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: RegistrationResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.registrationStatus = .failure(error.localizedDescription)
                }
            }, receiveValue: { response in
                // Handle registration response
                if response.success {
                    self.registrationStatus = .success
                } else {
                    self.registrationStatus = .failure(response.message)
                }
            })
            .store(in: &cancellables)
    }
}

struct RegistrationResponse: Codable {
    let success: Bool
    let message: String
}
