//
//  Center.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 12/03/2024.
//

import Foundation

struct Center: Codable {
    let id: String
    let centerName: String
    let description: String
    let email: [String]
    let phone: [String]
    let address: [String]
    let image: String
    let fanpage: String
    let website: String
    let workTime: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case centerName = "center_name"
        case description
        case email
        case phone
        case address
        case image
        case fanpage
        case website
        case workTime = "work_time"
    }
}

struct CenterResponse: Codable {
    let centers: [Center]
}
