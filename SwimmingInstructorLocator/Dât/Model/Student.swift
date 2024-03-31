//
//  Student.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 31/03/2024.
//

import Foundation

struct Student: Codable {
    let id: String
    let studentName: String
    let weight: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case studentName = "student_name"
        case weight
        case height
    }
}

struct StudentApiResponse: Codable {
    let message: String
    let data: [Student]
}
