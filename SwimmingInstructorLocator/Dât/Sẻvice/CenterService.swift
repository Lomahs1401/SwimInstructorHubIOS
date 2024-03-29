//
//  CenterService.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 25/03/2024.
//

import Foundation

class CenterService: CenterServiceProto {
    private let centerRepo: CenterRepo
    
    init (centerRepo: CenterRepo) {
        self.centerRepo = centerRepo
    }
    
    func getCenters(completion: @escaping (Result<[Center], Error>) -> Void) {
        centerRepo.getCenters(completion: completion)
    }
    
//    func searchCenters(searchValue: String, completion: @escaping (Result<[Center], Error>) -> Void) {
//        
//    }
//    
//    func getCourseOfInstructor(instructorId: String, completion: @escaping (Result<[Course], Error>) -> Void) {
//        
//    }
}
