//
//  ProfileViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 26/09/22.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    //MARK: Outlet Connection

    @IBOutlet weak var femaleProfile: UIImageView!
    @IBOutlet weak var maleProfile: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var mobile: UILabel!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetching data from user entity
        let user = DBOperations.dbOperationInstance().fetchMatchedRecord(email: (Auth.auth().currentUser?.email)!)
        
        name.text = user?.name
        email.text = user?.email
        mobile.text = user?.mobile
        
        //Checking if user gender is selected
        if (user?.gender == "NA") {
            
            //male profile image tap
            let maleTapGesture = UITapGestureRecognizer(target: self, action: #selector(maleImage))
            maleProfile.addGestureRecognizer(maleTapGesture)
            maleProfile.isUserInteractionEnabled = true
            
            //female profile image tap
            let femaleTapGesture = UITapGestureRecognizer(target: self, action: #selector(femaleImage))
            femaleProfile.addGestureRecognizer(femaleTapGesture)
            femaleProfile.isUserInteractionEnabled = true
        }
        //Checking if gender is male
        else if(user?.gender == "M") {
            
            //hidding female image
            femaleProfile.isHidden = true
        }
        //Checking if gender is female
        else if(user?.gender == "F") {
            
            //hidding male image
            maleProfile.isHidden = true
        }
        
    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    //MARK: User tapped on Male image
    @objc func maleImage() {
        
        //Hiding female profile
        femaleProfile.isHidden = true
        
        //Updating gender for user
        DBOperations.dbOperationInstance().storeGender(email: (Auth.auth().currentUser?.email!)!, gender: "M")
    }
    
    //MARK: User tapped on Female image
    @objc func femaleImage() {
        
        //Hiding Male profile
        maleProfile.isHidden = true
        
        //Updating gender for user
        DBOperations.dbOperationInstance().storeGender(email: (Auth.auth().currentUser?.email!)!, gender: "F")
    }

}
