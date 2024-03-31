//
//  HomePresenter.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 25/03/2024.
//

import Foundation

class HomePresenter: HomeContractPresenter {
    private weak var view: HomeContractView?
    private let centerService: CenterServiceProto
    
    init(centerService: CenterServiceProto) {
        self.centerService = centerService
    }
    
    func attachView(view: HomeContractView) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func getListCenters() {
        centerService.getCenters { [weak self] result in
            switch result {
            case .success(let centers):
                self?.view?.onGetListCenters(listCenters: centers)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
