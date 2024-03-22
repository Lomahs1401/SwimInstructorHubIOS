//
//  Appointment.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 12/03/2024.
//

import Foundation

struct Appointment: Codable {
    let id: String
    let courseName: String
    let teacherName: String
    let date: String
    let startTime: String
    let endTime: String
    let studentName: String
    let centerAddress: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case courseName = "course_name"
        case teacherName = "teacher_name"
        case date
        case startTime = "start_time"
        case endTime = "end_time"
        case studentName = "student_name"
        case centerAddress = "center_address"
        case status
    }
}

struct AppointmentResponse: Codable {
    let appointments: [Appointment]
}
