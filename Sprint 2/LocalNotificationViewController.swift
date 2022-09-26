//
//  LocalNotificationViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 24/09/22.
//

import UIKit
import localNotificationFramwork

class LocalNotificationViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    //MARK: Variable Decleration
    let notification = OrderPlacedNotifiction()
    
    //MARK: Outlet Connection
    @IBOutlet weak var localNotifiButton: UIButton!
    
    @IBOutlet weak var backToCategory: UIButton!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // local notification button
        localNotifiButton.layer.borderWidth = 2
        localNotifiButton.layer.borderColor = UIColor.tintColor.cgColor
        localNotifiButton.layer.cornerRadius = 10
        
        // notification delegate
        UNUserNotificationCenter.current().delegate = self
        

    }
    
    //MARK: Firing Local Notification
    @IBAction func localNotifiBtnClicked(_ sender: Any) {
        
        //custom notification call
        notification.orderPlaced()
    }
    
}
