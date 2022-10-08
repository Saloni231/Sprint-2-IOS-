//
//  CategoryCollectionViewCell.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 24/09/22.
//

import UIKit
import Firebase

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: Variable Decleration
    var parentVC: UIViewController!
    
    //MARK: Outlet Connection
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var addedToCart: UIImageView!
    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: Add To Cart Button Clicked
    @IBAction func addToCartPressed(_ sender: Any) {
        
        //Changing button image
        addedToCart.isHidden = false
        addToCart.isHidden = true
        
        //Storing data in cart entity
        DBOperations.dbOperationInstance().insertDataToCart(userEmail: (Auth.auth().currentUser?.email)!, productName: itemName.text!, productImage: (itemImage.image?.pngData())!, productPrice: itemPrice.text!, prodDesc: itemDescription.text!)
        
        //calling alert
        cartSuccessAlert()
        
    }
    

}

extension CategoryCollectionViewCell {
    
    //MARK: Success Alert Action for item added
    func cartSuccessAlert() {
        
        let sucessBox = UIAlertController(title: "Success!!", message: "Item Added to the Cart", preferredStyle: .alert)
        
        sucessBox.addAction(UIAlertAction(title: "Go To Cart", style: .default, handler: {(action: UIAlertAction!) in
            self.parentVC.tabBarController?.selectedIndex = 1
        }))
        sucessBox.addAction(UIAlertAction(title: "Continue Shopping", style: .cancel, handler: nil))
        
        parentVC.present(sucessBox, animated: true, completion: nil)
    }}
