//
//  HomePresenter.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 25/03/2024.
//

import Foundation

class RegisterPresenter: RegisterContractPresenter {
    private weak var view: RegisterContractView?
    private let authService: AuthServiceProto
    
    init(authService: AuthServiceProto) {
        self.authService = authService
    }
    
    func attachView(view: RegisterContractView) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func validateRegisterForm(registerDTO: RegisterDTO) -> Bool {
        let isValidUsername = validateUsername(registerDTO.username)
        let isValidEmail = validateEmail(registerDTO.email)
        let isValidPassword = validatePassword(registerDTO.password)
        
        return isValidUsername && isValidEmail && isValidPassword
    }
    
    func signUp(registerDTO: RegisterDTO) {
        authService.register(registerDTO) { [weak self] result in
            switch result {
            case .success(let newAccount):
                self?.view?.onSignUpSuccess(account: newAccount)
            case .failure(let error):
                switch error {
                case .invalidResponse:
                    self?.view?.onSignUpError(error: .invalidResponse)
                case .networkError:
                    self?.view?.onSignUpError(error: .networkError)
                case .emailAlreadyExists:
                    self?.view?.onSignUpError(error: .emailAlreadyExists)
                }
            }
        }
    }
    
    private func validateUsername(_ username: String) -> Bool {
        // Username is required
        if username.isEmpty {
            view?.showValidationError(message: NSLocalizedString("validate_username_blank", comment: ""), validationLabel: .username)
            return false
        }
        
        // Username must be between 4 and 18 characters
        if !isUsernameLengthValid(username) {
            view?.showValidationError(message: NSLocalizedString("validate_username_length", comment: ""), validationLabel: .username)
            return false
        }
        
        // The first character cannot be a numeric
        if startsWithNumeric(username) {
            view?.showValidationError(message: NSLocalizedString("validate_username_digit", comment: ""), validationLabel: .username)
            return false
        }
        
        // Clear any previous error messages if all validations pass
        view?.clearValidationError(validationLabel: .username)
        
        // All validations pass
        return true
    }
    
    private func validateEmail(_ email: String) -> Bool {
        // Email is required
        if email.isEmpty {
            view?.showValidationError(message: NSLocalizedString("validate_email_blank", comment: ""), validationLabel: .email)
            return false
        }
        
        // Email is invalid
        if !isEmailValid(email) {
            view?.showValidationError(message: NSLocalizedString("validate_email_invalid", comment: ""), validationLabel: .email)
            return false
        }
        
        // Clear any previous error messages if all validations pass
        view?.clearValidationError(validationLabel: .email)
        
        // All validations pass
        return true
    }
    
    private func validatePassword(_ password: String) -> Bool {
        // Password is required
        if password.isEmpty {
            view?.showValidationError(message: NSLocalizedString("validate_password_blank", comment: ""), validationLabel: .password)
            return false
        }
        
        // Password must be between 6 and 18 characters
        if !isPasswordLengthValid(password) {
            view?.showValidationError(message: NSLocalizedString("validate_password_length", comment: ""), validationLabel: .password)
            return false
        }
        
        // Password must contain 1 uppercase character, 1 alphanumeric character, and 1 special character
        if !isPasswordFormatValid(password) {
            view?.showValidationError(message: NSLocalizedString("validate_password_format", comment: ""), validationLabel: .password)
            return false
        }
        
        // Clear any previous error messages if all validations pass
        view?.clearValidationError(validationLabel: .password)
        
        // All validations pass
        return true
    }
    
    private func isUsernameLengthValid(_ username: String) -> Bool {
        return username.count >= 4 && username.count <= 18
    }
    
    private func isPasswordLengthValid(_ password: String) -> Bool {
        return password.count >= 6 && password.count <= 18
    }
    
    private func startsWithNumeric(_ username: String) -> Bool {
        return username.first?.isNumber ?? false
    }
    
    private func isEmailValid(_ email: String) -> Bool {
        let emailRegex = "^[A-Za-z](.*)([@]{1})(.{1,})(\\.)(.{1,})"
        return email.range(of: emailRegex, options: .regularExpression) != nil
    }
    
    private func isPasswordFormatValid(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$"
        return password.range(of: passwordRegex, options: .regularExpression) != nil
    }
}
