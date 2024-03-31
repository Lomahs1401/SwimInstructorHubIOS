//
//  RegisterDTO.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 31/03/2024.
//

import Foundation

struct RegisterDTO {
    let username: String
    let email: String
    let password: String
    let type: Int
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case email = "email"
        case password = "password"
        case type = "type"
    }
}
