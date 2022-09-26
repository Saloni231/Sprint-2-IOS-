//
//  DashboardViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 24/09/22.
//

import UIKit

class DashboardViewController: UITabBarController, UITabBarControllerDelegate {

    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    
    //MARK: Did Select View Controller
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let vc = viewController as? UINavigationController {
            
            vc.popToRootViewController(animated: true)
        }
    }
}
