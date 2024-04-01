//
//  AuthRepo.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 31/03/2024.
//

import Foundation
import Alamofire

struct ErrorResponse: Codable {
    let error: String
}

enum AuthError: Error {
    case emailAlreadyExists
    case networkError
    case invalidResponse
}

class AuthRepo {
    func login(_ loginDTO: LoginDTO, completion: @escaping (Result<Account, Error>) -> Void) {
        
    }
    
    func register(_ registerDTO: RegisterDTO, completion: @escaping (Result<AccountApiResponse, AuthError>) -> Void) {
        let parameters: [String: Any] = [
            "username": registerDTO.username,
            "email": registerDTO.email,
            "password": registerDTO.password,
            "type": registerDTO.type
        ]
        
        AF.request(Constant.BASE_URL + "/auth/register", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { dataResponse in
            switch dataResponse.result {
            case .success(let data):
                print(data)
                if let httpResponse = dataResponse.response {
                    if (200..<300).contains(httpResponse.statusCode) {
                        // Request succeeded
                        do {
                            let accountResponse = try JSONDecoder().decode(AccountApiResponse.self, from: data)
                            completion(.success(accountResponse))
                        } catch {

                            completion(.failure(.invalidResponse))
                        }
                    } else {
                        // Request failed with error
                        do {
                            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                            let error = NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorResponse.error])
                            completion(.failure(.emailAlreadyExists))
                        } catch {
                            completion(.failure(.networkError))
                        }
                    }
                }
            case .failure(_):
                // Request failed with AFError, or network error, or invalid response json
                completion(.failure(.networkError))
            }
        }
    }
    
    func logout(completion: @escaping (Result<Account, Error>) -> Void) {
        
    }
    
    func getCurrentUser(completion: @escaping (Result<Account, Error>) -> Void) {
        
    }
}
