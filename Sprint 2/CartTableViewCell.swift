//
//  CartTableViewCell.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    //MARK: Variable Decleration
    var parentVC: CartViewController!
    
    //MARK: Outlet Connection
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var removeBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Remove Item Function
    @IBAction func removeItemClicked(_ sender: Any) {
        
        //Removing item from cart
        DBOperations.dbOperationInstance().removeItemFromCart(productName: itemName.text!)
        
        //Updating table
        parentVC.callFetchCartRecord()
    }
}
