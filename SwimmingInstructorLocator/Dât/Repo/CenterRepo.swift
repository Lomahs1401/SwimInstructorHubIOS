//
//  CenterRepo.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 25/03/2024.
//

import Foundation
import Alamofire

class CenterRepo {
    func getCenters(completion: @escaping (Result<[Center], Error>) -> Void) {
        AF.request(Constant.BASE_URL + "/centers", method: .get).responseDecodable(of: CenterApiResponse.self) { dataResponse in
            switch dataResponse.result {
            case .success(let centerResponse):
                completion(.success(centerResponse.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
