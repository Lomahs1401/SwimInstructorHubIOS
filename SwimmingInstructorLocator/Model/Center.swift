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
    let managerId: String
    let email: String
    let address: String
    let description: String
    let image: String
    let phone: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case centerName = "center_name"
        case managerId = "manager"
        case email
        case address
        case description
        case image
        case phone
    }
}

struct CenterResponse: Codable {
    let centers: [Center]
}
