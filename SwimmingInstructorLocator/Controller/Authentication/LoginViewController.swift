//
//  LoginViewController.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 22/03/2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginFormView: UIView!
    @IBOutlet weak var facebookImg: UIImageView!
    @IBOutlet weak var googleImg: UIImageView!
    @IBOutlet weak var twitterImg: UIImageView!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mailValidation: UILabel!
    @IBOutlet weak var passwordValidation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        
        mailValidation.isHidden = true
        passwordValidation.isHidden = true
        
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
    
    private func configView() {
        // Corner round view
        loginFormView.layer.cornerRadius = 24
        // Add shadow
        loginFormView.layer.shadowColor = UIColor.black.cgColor
        loginFormView.layer.shadowOpacity = 0.3
        loginFormView.layer.shadowOffset = CGSize(width: 0, height: 4)
        loginFormView.layer.shadowRadius = 4
        loginFormView.layer.masksToBounds = false
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
        
        mainTabBarController.hero.isEnabled = true
        mainTabBarController.hero.modalAnimationType = .zoom
        
        self.hero.replaceViewController(with: mainTabBarController)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        if let email = mailTextField.text, email.isEmpty {
            mailValidation.isHidden = false
        } else {
            mailValidation.isHidden = true
        }
        
        if let password = passwordTextField.text, password.isEmpty {
            passwordValidation.isHidden = false
        } else {
            passwordValidation.isHidden = true
        }
    }
}
