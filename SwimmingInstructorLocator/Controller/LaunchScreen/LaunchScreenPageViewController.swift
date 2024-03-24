//
//  OnBoardingPageViewController.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 10/03/2024.
//

import UIKit

class LaunchScreenPageViewController: UIPageViewController {
    
    lazy var vcArray: [UIViewController] = {
        let storyBoard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        
        let vcOne = storyBoard.instantiateViewController(identifier: "onboarding_one")
        let vcTwo = storyBoard.instantiateViewController(identifier: "onboarding_two")
        let vcThree = storyBoard.instantiateViewController(identifier: "onboarding_three")
        
        return [vcOne, vcTwo, vcThree]
    }()
    
    var currentPage = 0
    var pageIndicatorApperance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for subviews in self.view.subviews {
            if subviews is UIScrollView {
                subviews.frame = self.view.bounds
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        pageIndicatorApperance.pageIndicatorTintColor = .white
        pageIndicatorApperance.currentPageIndicatorTintColor = .systemCyan
        
        if let vc = vcArray.first {
            self.setViewControllers([vc], direction: .forward, animated: true )
        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(navigateToNextPage),
            name: NSNotification.Name(Notification.Name.nextButtonClicked),
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(switchToMainViewController),
            name: NSNotification.Name(Notification.Name.getStartedButtonClicked),
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(switchToMainViewController),
            name: NSNotification.Name(Notification.Name.skipButtonClicked),
            object: nil
        )
    }
    
    @objc func navigateToNextPage() {
        // Chuyển đến trang kế tiếp
        if let currentViewController = self.viewControllers?.first, let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    @objc func switchToMainViewController() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
        
        mainTabBarController.hero.isEnabled = true
        mainTabBarController.hero.modalAnimationType = .zoom
        self.hero.replaceViewController(with: mainTabBarController)
    }
}

extension LaunchScreenPageViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return vcArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentPage
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcArray.lastIndex(of: viewController) else { return nil }
        
        let previousIndex = index - 1
        guard previousIndex >= 0 else { return nil }
        guard previousIndex < vcArray.count else { return nil }
        
        currentPage = index - 1
        return vcArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcArray.lastIndex(of: viewController) else { return nil }
        
        let nextIndex = index + 1
        guard nextIndex >= 0 else { return nil }
        guard nextIndex < vcArray.count else { return nil }
        
        currentPage = index + 1
        return vcArray[nextIndex]
    }
}
