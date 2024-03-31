//
//  AuthRepo.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 31/03/2024.
//

import Foundation
import Alamofire

class AuthRepo {
    func login(_ loginDTO: LoginDTO, completion: @escaping (Result<Account, Error>) -> Void) {
        
    }
    
    func register(_ registerDTO: RegisterDTO, completion: @escaping (Result<Account, Error>) -> Void) {
        let parameters: [String: Any] = [
            "username": registerDTO.username,
            "email": registerDTO.email,
            "password": registerDTO.password,
            "type": registerDTO.type
        ]
        
        AF.request(Constant.BASE_URL + "/auth/register", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: AccountApiResponse.self) { dataResponse in
            switch dataResponse.result {
            case .success(let accountResponse):
                completion(.success(accountResponse.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func logout(completion: @escaping (Result<Account, Error>) -> Void) {
        
    }
    
    func getCurrentUser(completion: @escaping (Result<Account, Error>) -> Void) {
        
    }
}
