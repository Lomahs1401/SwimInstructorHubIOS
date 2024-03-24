//
//  RegisterViewController.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 22/03/2024.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerFormView: UIView!
    @IBOutlet weak var btnRoleStudent: UIButton!
    @IBOutlet weak var btnRoleTeacher: UIButton!
    @IBOutlet weak var btnBackToHome: UIButton!
    
    private var roleStudent = true // Default
    private var roleTeacher = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
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
        registerFormView.layer.cornerRadius = 30
        // Add shadow
        registerFormView.layer.shadowColor = UIColor.black.cgColor
        registerFormView.layer.shadowOpacity = 0.3
        registerFormView.layer.shadowOffset = CGSize(width: 0, height: 4)
        registerFormView.layer.shadowRadius = 4
        registerFormView.layer.masksToBounds = false
    }
    
    @IBAction func didTappedRoleStudent(_ sender: UIButton) {
        if roleStudent {
            return
        } else {
            btnRoleStudent.imageView?.image = UIImage(named: "radio_button_on")
            btnRoleTeacher.imageView?.image = UIImage(named: "radio_button_off")
        }
    }
    
    @IBAction func didTappedRoleTeacher(_ sender: Any) {
        if roleTeacher {
            return
        } else {
            btnRoleStudent.imageView?.image = UIImage(named: "radio_button_off")
            btnRoleTeacher.imageView?.image = UIImage(named: "radio_button_on")
        }
    }
    
    @IBAction func backToHome(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
        
        mainTabBarController.hero.isEnabled = true
        mainTabBarController.hero.modalAnimationType = .zoom
        self.hero.replaceViewController(with: mainTabBarController)
        navigationController?.isNavigationBarHidden = true
    }
}
