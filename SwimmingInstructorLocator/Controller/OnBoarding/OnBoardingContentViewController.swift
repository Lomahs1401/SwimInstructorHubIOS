//
//  OnBoardingContentViewController.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 11/03/2024.
//

import UIKit

enum OnboardingContentType {
    case SlideOne
    case SlideTwo
    case SlideThree
}

class OnBoardingContentViewController: UIViewController {
    
    var contentType: OnboardingContentType = .SlideOne
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup UI components based on contentType
        configureUI()
    }
    
    func configureUI() {
        switch contentType {
        case .SlideOne:
            // Configure UI for type A
            break
        case .SlideTwo:
            // Configure UI for type B
            break
        case .SlideThree:
            // Configure UI for type C
            break
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: Notification.Name(Notification.Name.nextButtonClicked),
            object: nil
        )
    }
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: NSNotification.Name(Notification.Name.getStartedButtonClicked),
            object: nil
        )
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: NSNotification.Name(Notification.Name.skipButtonClicked),
            object: nil
        )
    }
}
