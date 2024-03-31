//
//  AuthServiceProto.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 31/03/2024.
//

import Foundation

protocol AuthServiceProto {
    func login(_ loginDTO: LoginDTO, completion: @escaping (Result<Account, Error>) -> Void)
    func register(_ registerDTO: RegisterDTO, completion: @escaping (Result<Account, Error>) -> Void)
    func logout(completion: @escaping (Result<Account, Error>) -> Void)
    func getCurrentUser(completion: @escaping (Result<Account, Error>) -> Void)
}
