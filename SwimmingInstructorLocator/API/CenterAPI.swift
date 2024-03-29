//
//  CenterAPI.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 29/03/2024.
//

import Foundation

class CenterAPI {
    struct CenterApiResponse: Decodable {
        let message: String
        let data: [Center]
    }
}
