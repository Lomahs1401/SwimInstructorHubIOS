//
//  User.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 12/03/2024.
//

import Foundation

struct Account: Codable {
    let id: String
    let username: String
    let email: String
    let avatar: String
    let gender: Int
    let address: String
    let phone: String
    let type: Int
    let createdAt: String
    let updatedAt: String
    let studentInfo: [Student]?
    let instructorInfo: [Instructor]?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username
        case email
        case avatar
        case gender
        case address
        case phone
        case type
        case createdAt
        case updatedAt
        case studentInfo = "student_info"
        case instructorInfo = "instructor_info"
    }
}

struct AccountApiResponse: Codable {
    let message: String
    let data: Account
    
    enum CodingKeys: String, CodingKey {
        case message
        case data
    }
}
