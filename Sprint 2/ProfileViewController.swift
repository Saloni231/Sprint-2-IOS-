//
//  ProfileViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 26/09/22.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Outlet Connection

    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var femaleProfile: UIImageView!
    @IBOutlet weak var maleProfile: UIImageView!
    
    @IBOutlet weak var changeProfileButton: UIButton!
        
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var mobile: UILabel!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Profile Image View
        femaleProfile.layer.cornerRadius = femaleProfile.frame.height / 2
        maleProfile.layer.cornerRadius = maleProfile.frame.height / 2
        
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
        
        //checking if profile image is set
        if (user?.profileImage != nil) {
            
            //Checking gender for profile
            if (user?.gender == "F") {
                
                femaleProfile.image = UIImage(data: (user?.profileImage)!)
                changeProfileButton.isHidden = false
                chooseLabel.isHidden = true
                maleProfile.isHidden = true
            }
            else if (user?.gender == "M") {
                
                maleProfile.image = UIImage(data: (user?.profileImage)!)
                changeProfileButton.isHidden = false
                chooseLabel.isHidden = true
                femaleProfile.isHidden = true
            }
        }
        
        else {
            
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
            
                //Displaying Change Profile Option
                changeProfileButton.isHidden = false
            }
            
            //Checking if gender is female
            else if(user?.gender == "F") {
                
                //hidding male image
                maleProfile.isHidden = true
                chooseLabel.isHidden = true
                
                //Displaying Change Profile Option
                changeProfileButton.isHidden = false
            }
            
        }
        
    }
    
    //MARK: User tapped on Male image
    @objc func maleImage() {
        
        //Hiding female profile
        femaleProfile.isHidden = true
        chooseLabel.isHidden = true
        
        //Displaying Change Profile Option
        changeProfileButton.isHidden = false
        
        //Updating gender for user
        DBOperations.dbOperationInstance().storeGender(email: (Auth.auth().currentUser?.email!)!, gender: "M")
    }
    
    //MARK: User tapped on Female image
    @objc func femaleImage() {
        
        //Hiding Male profile
        maleProfile.isHidden = true
        chooseLabel.isHidden = true
        
        //Displaying Change Profile Option
        changeProfileButton.isHidden = false
        
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
    
    //MARK: Change Profile Button Clicked
    @IBAction func changeProfileClicked(_ sender: Any) {
        
        let imageVC = UIImagePickerController()
        imageVC.sourceType = .photoLibrary
        imageVC.delegate = self
        imageVC.allowsEditing = true
        present(imageVC, animated: true)
    
    }
    
    //MARK: Did Finish Picking Media with Info Function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            
            if (maleProfile.isHidden) {
                femaleProfile.image = image
            }
            
            if (femaleProfile.isHidden) {
                maleProfile.image = image
            }
            
            DBOperations.dbOperationInstance().storeProfileToUser(email: (Auth.auth().currentUser?.email)!, profileImage: image.pngData()!)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Image Picker Did Cancel Function
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}
