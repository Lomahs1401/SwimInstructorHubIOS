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
    let password: String
    let avatar: String
    let gender: Int
    let address: String
    let phone: String
    let type: Int
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username
        case email
        case password
        case avatar
        case gender
        case address
        case phone
        case type
        case createdAt
        case updatedAt
        
    }
}

struct AccountApiResponse: Codable {
    let message: String
    let data: AccountData
    
    enum CodingKeys: String, CodingKey {
        case message
        case data
    }
}

struct AccountData: Codable {
    let id: String
    let username: String
    let email: String
    let password: String
    let avatar: String
    let gender: String
    let address: String
    let phone: String
    let type: Int
    let createdAt: String
    let updatedAt: String
    let __v: Int
    let studentInfo: Student?
    let instructorInfo: Instructor?
        
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username
        case email
        case password
        case avatar
        case gender
        case address
        case phone
        case type
        case createdAt
        case updatedAt
        case __v
        case studentInfo = "student_info"
        case instructorInfo = "instructor_info"
    }
}
