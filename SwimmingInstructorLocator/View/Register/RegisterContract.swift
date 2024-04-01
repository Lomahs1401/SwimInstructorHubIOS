//
//  HomeContract.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 25/03/2024.
//

import Foundation

protocol RegisterContractView: AnyObject {
    func showValidationError(message: String, validationLabel: ValidationLabelType)
    func clearValidationError(validationLabel: ValidationLabelType)
    func onSignUpSuccess(account: AccountApiResponse)
    func onSignUpError(error: AuthError)
}

protocol RegisterContractPresenter {
    func attachView(view: RegisterContractView)
    func detachView()
    func validateRegisterForm(registerDTO: RegisterDTO) -> Bool
    func signUp(registerDTO: RegisterDTO)
}
