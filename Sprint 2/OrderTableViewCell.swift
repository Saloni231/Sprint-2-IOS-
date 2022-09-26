//
//  OrderTableViewCell.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 23/09/22.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    //MARK: Outlet Connection
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
