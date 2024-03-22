//
//  User.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 12/03/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let username: String
    let fullName: String
    let email: String
    let avatar: String
    let gender: Int
    let address: String
    let phone: String
    let type: Int
    let weight: String
    let height: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username
        case fullName = "fullname"
        case email
        case avatar
        case gender
        case address
        case phone
        case type
        case weight
        case height
        case createdAt
        case updatedAt
    }
}

struct UserResponse: Codable {
    let users: [User]
}
