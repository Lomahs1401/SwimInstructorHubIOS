//
//  HomePresenter.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 25/03/2024.
//

import Foundation

class LoginPresenter: LoginContractPresenter {
    private weak var view: LoginContractView?
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func attachView(view: LoginContractView) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func validateLoginForm(loginDTO: LoginDTO) -> Bool {
        return true
    }
    
    func signIn(loginDTO: LoginDTO) {
        
    }
}
