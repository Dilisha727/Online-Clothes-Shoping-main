//
//  UserModel.swift
//  Online Clothes Shoping
//
//  Created by NIBM on 2024-03-25.
//
import Foundation

struct User: Codable, Equatable {
    let email: String
    let password: String
    let fullName: String
    let phoneNumber: String
    let address: String
    let confirmPassword: String  // Used locally for validation, not part of the API request/response

    enum CodingKeys: String, CodingKey {
        case email, password, fullName, phoneNumber, address
    }

    init(email: String, password: String, fullName: String, phoneNumber: String, address: String, confirmPassword: String) {
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
        confirmPassword = ""
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(fullName, forKey: .fullName)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(address, forKey: .address)
    }
}
