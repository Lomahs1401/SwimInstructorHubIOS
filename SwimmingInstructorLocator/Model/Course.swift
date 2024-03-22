//
//  Course.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 12/03/2024.
//

import Foundation

struct Course: Codable {
    let id: String
    let courseName: String
    let description: String
    let image: String
    let schedule: String
    let numberOfStudents: Int
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case courseName = "course_name"
        case description
        case image
        case schedule
        case numberOfStudents = "number_of_students"
        case price
    }
}

struct CourseResponse: Codable {
    let courses: [Course]
}
