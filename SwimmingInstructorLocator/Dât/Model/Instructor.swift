//
//  Instructor.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 12/03/2024.
//

import Foundation

struct Instructor: Codable {
    let id: String
    let instructorName: String
    let description: String
    let image: String
    let certificate: String
    let graduate: String
    let yearExperiences: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case instructorName = "teacher_name"
        case description
        case image
        case certificate
        case graduate
        case yearExperiences = "experience"
    }
}

struct InstructorResponse: Codable {
    let instructors: [Instructor]
}
