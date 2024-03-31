//
//  RegisterViewController.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 22/03/2024.
//

import UIKit
import MBRadioCheckboxButton

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
    
    private var isRoleStudentChecked = true
    private var isRoleTeacherChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        
        usernameValidation.isHidden = true
        mailValidation.isHidden = true
        passwordValidation.isHidden = true
        
        btnRoleStudent.delegate = self
        btnRoleTeacher.delegate = self
        
        btnRoleStudent.isOn = isRoleStudentChecked
        btnRoleTeacher.isOn = isRoleTeacherChecked
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        enableHero()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disableHero()
    }
    
    private func configView() {
        // Corner round view
        registerFormView.layer.cornerRadius = 24
        // Add shadow
        registerFormView.layer.shadowColor = UIColor.black.cgColor
        registerFormView.layer.shadowOpacity = 0.3
        registerFormView.layer.shadowOffset = CGSize(width: 0, height: 4)
        registerFormView.layer.shadowRadius = 4
        registerFormView.layer.masksToBounds = false
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
        
        mainTabBarController.hero.isEnabled = true
        mainTabBarController.hero.modalAnimationType = .zoom
        self.hero.replaceViewController(with: mainTabBarController)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        if let username = usernameTextField.text, username.isEmpty {
            usernameValidation.isHidden = false
        } else {
            usernameValidation.isHidden = true
        }
        
        if let email = emailTextField.text, email.isEmpty {
            mailValidation.isHidden = false
        } else {
            mailValidation.isHidden = true
        }
        
        if let password = passwordTextField.text, password.isEmpty {
            passwordValidation.isHidden = false
        } else {
            passwordValidation.isHidden = true
        }
        
        if usernameValidation.isHidden && mailValidation.isHidden && passwordValidation.isHidden {
            let currentRole = getCurrentRoleString()
            let createAccountMsg = NSLocalizedString(currentRole, comment: "")
            let alertController = UIAlertController(title: NSLocalizedString("Confirm", comment: ""), message: NSLocalizedString(createAccountMsg, comment: ""), preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default) { _ in
                alertController.dismiss(animated: true, completion: nil)
            }
            
            let confirmAction = UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default) { _ in
                self.createUserWithCurrentRole()
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(confirmAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            return
        }
    }
    
    private func getCurrentRoleString() -> String {
        return isRoleStudentChecked ? "CreateNewStudentAccount" : "CreateNewInstructorAccount"
    }
    
    private func createUserWithCurrentRole() {
        
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
