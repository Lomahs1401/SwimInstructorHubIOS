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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        // Corner round view
        loginFormView.layer.cornerRadius = 30
        // Add shadow
        loginFormView.layer.shadowColor = UIColor.black.cgColor
        loginFormView.layer.shadowOpacity = 0.3
        loginFormView.layer.shadowOffset = CGSize(width: 0, height: 4)
        loginFormView.layer.shadowRadius = 4
        loginFormView.layer.masksToBounds = false
        
//        let borderFacebook = CAShapeLayer()
//        borderFacebook.path = UIBezierPath(ovalIn: facebookImg.bounds).cgPath
//        borderFacebook.fillColor = UIColor.clear.cgColor
//        borderFacebook.strokeColor = UIColor.white.cgColor // Màu viền
//        borderFacebook.lineWidth = 2 // Độ dày của viền
//        
//        facebookImg.layer.addSublayer(borderFacebook)
//        facebookImg.layer.cornerRadius = facebookImg.bounds.height / 2
//        facebookImg.clipsToBounds = true
//        
//        let borderGoogle = CAShapeLayer()
//        borderGoogle.path = UIBezierPath(ovalIn: googleImg.bounds).cgPath
//        borderGoogle.fillColor = UIColor.clear.cgColor
//        borderGoogle.strokeColor = UIColor.black.cgColor // Màu viền
//        borderGoogle.lineWidth = 2 // Độ dày của viền
//        
//        googleImg.layer.addSublayer(borderGoogle)
//        googleImg.layer.cornerRadius = googleImg.bounds.height / 2
//        googleImg.clipsToBounds = true
//        
//        let borderTwitter = CAShapeLayer()
//        borderTwitter.path = UIBezierPath(ovalIn: twitterImg.bounds).cgPath
//        borderTwitter.fillColor = UIColor.clear.cgColor
//        borderTwitter.strokeColor = UIColor.black.cgColor // Màu viền
//        borderTwitter.lineWidth = 2 // Độ dày của viền
//        
//        twitterImg.layer.addSublayer(borderTwitter)
//        twitterImg.layer.cornerRadius = twitterImg.bounds.height / 2
//        twitterImg.clipsToBounds = true
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController

        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = scene.windows.first {
                window.rootViewController = mainTabBarController
                window.makeKeyAndVisible()
            }
        }
    }
    

}
