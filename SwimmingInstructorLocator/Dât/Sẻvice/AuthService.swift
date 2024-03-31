//
//  AuthService.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 31/03/2024.
//

import Foundation

class AuthService: AuthServiceProto {
    private let authRepo: AuthRepo
    
    init(authRepo: AuthRepo) {
        self.authRepo = authRepo
    }
    
    func login(_ loginDTO: LoginDTO, completion: @escaping (Result<Account, Error>) -> Void) {
        authRepo.login(loginDTO, completion: completion)
    }
    
    func register(_ registerDTO: RegisterDTO, completion: @escaping (Result<Account, Error>) -> Void) {
        authRepo.register(registerDTO, completion: completion)
    }
    
    func logout(completion: @escaping (Result<Account, Error>) -> Void) {
        authRepo.logout(completion: completion)
    }
    
    func getCurrentUser(completion: @escaping (Result<Account, Error>) -> Void) {
        authRepo.getCurrentUser(completion: completion)
    }
}
