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

    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var femaleProfile: UIImageView!
    @IBOutlet weak var maleProfile: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var mobile: UILabel!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        
        //calling function for profile image
        profileImage()
    }
    
    //MARK: Function for setting profile image
    func profileImage() {
        
        //fetching data from user entity
        let user = DBOperations.dbOperationInstance().fetchMatchedRecord(email: (Auth.auth().currentUser?.email)!)
        
        //Assigning Values
        name.text = (user?.name)?.capitalized
        email.text = (user?.email)?.capitalized
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
            chooseLabel.isHidden = true
        }
        //Checking if gender is female
        else if(user?.gender == "F") {
            
            //hidding male image
            maleProfile.isHidden = true
            chooseLabel.isHidden = true
        }
        
    }
    
    //MARK: User tapped on Male image
    @objc func maleImage() {
        
        //Hiding female profile
        femaleProfile.isHidden = true
        chooseLabel.isHidden = true
        
        //Updating gender for user
        DBOperations.dbOperationInstance().storeGender(email: (Auth.auth().currentUser?.email!)!, gender: "M")
    }
    
    //MARK: User tapped on Female image
    @objc func femaleImage() {
        
        //Hiding Male profile
        maleProfile.isHidden = true
        chooseLabel.isHidden = true
        
        //Updating gender for user
        DBOperations.dbOperationInstance().storeGender(email: (Auth.auth().currentUser?.email!)!, gender: "F")
    }
    
    //MARK: Sign Out
    @IBAction func signOutClicked(_ sender: Any) {
        
        do {
            //Signing out of firebase
            try Auth.auth().signOut()
            
            //Navigating back to login view
            self.navigationController?.popToRootViewController(animated: true)
        } catch(let error) {
            
            print(error.localizedDescription)
        }
    }
    
}
