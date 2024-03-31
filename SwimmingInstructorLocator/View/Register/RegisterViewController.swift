//
//  RegisterViewController.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 22/03/2024.
//

import UIKit
import MBRadioCheckboxButton

enum AccountType {
    case ROLE_STUDENT
    case ROLE_INSTRUCTOR
}

enum ValidationLabelType {
    case username
    case email
    case password
}

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerFormView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameValidation: UILabel!
    @IBOutlet weak var mailValidation: UILabel!
    @IBOutlet weak var passwordValidation: UILabel!
    @IBOutlet weak var roleStudentLabel: UILabel!
    @IBOutlet weak var roleInstructorLabel: UILabel!
    @IBOutlet weak var btnRoleStudent: RadioButton!
    @IBOutlet weak var btnRoleTeacher: RadioButton!
    
    private var isRoleStudentChecked = true // Default Role Student
    private var isRoleTeacherChecked = false
    
    private var presenter: RegisterContractPresenter!
    private var authRepo: AuthRepo!
    private var authService: AuthServiceProto!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configRegisterFormView()
        hideValidationMsg()
        
        btnRoleStudent.isOn = isRoleStudentChecked
        btnRoleTeacher.isOn = isRoleTeacherChecked
        
        btnRoleStudent.delegate = self
        btnRoleTeacher.delegate = self
        
        authRepo = AuthRepo()
        authService = AuthService(authRepo: authRepo)
        presenter = RegisterPresenter(authService: authService)
        presenter.attachView(view: self)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        enableHero()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disableHero()
    }
    
    private func configRegisterFormView() {
        // Corner round view
        registerFormView.layer.cornerRadius = 24
        // Add shadow
        registerFormView.layer.shadowColor = UIColor.black.cgColor
        registerFormView.layer.shadowOpacity = 0.3
        registerFormView.layer.shadowOffset = CGSize(width: 0, height: 4)
        registerFormView.layer.shadowRadius = 4
        registerFormView.layer.masksToBounds = false
    }
    
    private func hideValidationMsg() {
        usernameValidation.isHidden = true
        mailValidation.isHidden = true
        passwordValidation.isHidden = true
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
        
        mainTabBarController.hero.isEnabled = true
        mainTabBarController.hero.modalAnimationType = .zoom
        self.hero.replaceViewController(with: mainTabBarController)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func handleClickSignUp(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        let registerDTO = RegisterDTO(username: username, email: email, password: password, type: isRoleStudentChecked ? 0 : 1)
        
        let isRegisterFormValid = presenter.validateRegisterForm(registerDTO: registerDTO)
        
        if isRegisterFormValid {
            let currentRole = getCurrentRoleString()
            let createAccountMsg = NSLocalizedString(currentRole, comment: "")
            let alertController = UIAlertController(title: NSLocalizedString("Confirm", comment: ""), message: NSLocalizedString(createAccountMsg, comment: ""), preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default) { _ in
                alertController.dismiss(animated: true, completion: nil)
            }
            
            let confirmAction = UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default) { _ in
                self.presenter.signUp(registerDTO: registerDTO)
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(confirmAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    private func getCurrentRoleString() -> String {
        return isRoleStudentChecked ? "CreateNewStudentAccount" : "CreateNewInstructorAccount"
    }
}

extension RegisterViewController: RadioButtonDelegate {
    func radioButtonDidSelect(_ button: MBRadioCheckboxButton.RadioButton) {
        if button == btnRoleStudent {
            isRoleStudentChecked = true
            isRoleTeacherChecked = false
        } else if button == btnRoleTeacher {
            isRoleTeacherChecked = true
            isRoleStudentChecked = false
        }
    }
    
    func radioButtonDidDeselect(_ button: MBRadioCheckboxButton.RadioButton) {
        print("Role student status: \(isRoleStudentChecked)")
        print("Role teacher status: \(isRoleTeacherChecked)")
    }
}

extension RegisterViewController: RegisterContractView {
    func showValidationError(message: String, validationLabel: ValidationLabelType) {
        switch validationLabel {
        case .username:
            usernameValidation.isHidden = false
            usernameValidation.text = message
        case .email:
            mailValidation.isHidden = false
            mailValidation.text = message
        case .password:
            passwordValidation.isHidden = false
            passwordValidation.text = message
        }
    }
    
    func clearValidationError(validationLabel: ValidationLabelType) {
        switch validationLabel {
        case .username:
            usernameValidation.isHidden = true
            usernameValidation.text = ""
        case .email:
            mailValidation.isHidden = true
            mailValidation.text = ""
        case .password:
            passwordValidation.isHidden = true
            passwordValidation.text = ""
        }
    }
    
    func onSignUpSuccess() {
        
    }
    
    func onSignUpError() {
        
    }
}
