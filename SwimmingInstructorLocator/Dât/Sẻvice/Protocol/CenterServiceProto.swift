//
//  CenterServiceImpl.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 25/03/2024.
//

import Foundation

protocol CenterServiceProto {
    func getCenters(completion: @escaping (Result<[Center], Error>) -> Void)
//    func getCenterDetail(id: String, completion: @escaping (Result<CenterDetail, Error>) -> Void)
//    func searchCenters(searchValue: String, completion: @escaping (Result<[Center], Error>) -> Void)
//    func getCourseOfInstructor(instructorId: String, completion: @escaping (Result<[Course], Error>) -> Void)
}
