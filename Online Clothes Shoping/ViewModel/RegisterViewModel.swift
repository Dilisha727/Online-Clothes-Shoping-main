//
//  ProductViewModel.swift
//  Online Clothes Shoping
//
//  Created by Dilisha priyashan on 2024-03-30.
//

import Foundation

struct UserRegistration: Codable {
    var email: String
    var password: String
    var fullName: String
    var phoneNumber: String
    var address: String
    var confirmPassword: String
}

class UserRegistrationService {
    func registerUser(userRegistration: UserRegistration, completion: @escaping (Bool, String) -> Void) {
        guard let url = URL(string: "https://ios-backend-gykn.onrender.com/register") else {
            completion(false, "Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(userRegistration)
        } catch {
            completion(false, "Error encoding user registration data")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                completion(false, "Failed to register user")
                return
            }

            completion(true, "User registered successfully")
        }.resume()
    }
}
