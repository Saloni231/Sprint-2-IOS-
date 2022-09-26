//
//  OrdersViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 26/09/22.
//

import UIKit
import Firebase

//MARK: Placed Order Table View Cell
class PlacedOrderTableCell: UITableViewCell {
    
    //MARK: Outlet Connection
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
}

class OrdersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Variable Decleration
    var order: [Cart]!

    //MARK: Outlet Connection
    @IBOutlet weak var placedOrderTable: UITableView!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        //Table view
        placedOrderTable.dataSource = self
        placedOrderTable.delegate = self
        
    }
    
    //MARK: View will appear
    override func viewWillAppear(_ animated: Bool) {
        
        //Hidding Bottom Bar
        self.tabBarController?.tabBar.isHidden = true
        
        //function call to fetch data
        fetchPlacedOrder()
    }
    
    //MARK: Function for fetching placed order
    func fetchPlacedOrder() {
        
        order = DBOperations.dbOperationInstance().fetchCartRecordForOrderScreen(userEmail: (Auth.auth().currentUser?.email!)!)
        
    }
    
    //MARK: Number of rows function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return order.count
    }
    
    //MARK: Cell for row function
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = placedOrderTable.dequeueReusableCell(withIdentifier: "placedOrder", for: indexPath) as! PlacedOrderTableCell
        
        item.itemName.text = order[indexPath.row].product_name
        item.itemImage.image = UIImage(data: order[indexPath.row].product_image!)
        
        return item
        
    }
    
    //MARK: Height for cell function
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120.0
    }
    
}
