//
//  HomeContract.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 25/03/2024.
//

import Foundation

protocol LoginContractView: AnyObject {
    func onSignIn(account: Account)
}

protocol LoginContractPresenter {
    func attachView(view: LoginContractView)
    func detachView()
    func validateLoginForm(loginDTO: LoginDTO) -> Bool
    func signIn(loginDTO: LoginDTO)
}
