//
//  CartViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 21/09/22.
//

import UIKit
import Firebase

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: Variable decleration
    var cartItem : [Cart] = []
    
    //MARK: Outlet Connection
    
    @IBOutlet weak var cartTitle: UILabel!
    
    @IBOutlet weak var emptyCartView: UIView!
    
    @IBOutlet weak var noOfItemLabel: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var addToBagBtn: UIButton!
    
    @IBOutlet weak var orderBtn: UIButton!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //registering cell
        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cartItems")

    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        
        //Tabbar
        self.tabBarController?.tabBar.isHidden = false
        
        //function call for fetching data for cart
        callFetchCartRecord()
    }
    
    //MARK: Function call for fetching data for cart
    func callFetchCartRecord() {
        
        //Checking If cart is empty for particular user and no order is placed
        if DBOperations.dbOperationInstance().fetchCartRecord(userEmail: (Auth.auth().currentUser?.email)!) != nil {
            
            //Hidding empty cart View
            emptyCartView.isHidden = true
            
            //Fetching data
            cartItem = DBOperations.dbOperationInstance().fetchCartRecord(userEmail: (Auth.auth().currentUser?.email)!)!
            
            //Table view
            cartTableView.dataSource = self
            cartTableView.delegate = self
            cartTableView.reloadData()
            
            //No of item in table
            noOfItemLabel.text = String(cartItem.count) + " Item selected for order"
        }
        //Checking if cart is empty for particular user and order is placed
        else if DBOperations.dbOperationInstance().fetchCartRecordForOrderScreen(userEmail: (Auth.auth().currentUser?.email)!) != nil {
            
            //showing order screen button
            orderBtn.isHidden = false
            
            //Showing empty cart screen
            emptyCartView.isHidden = false
        }
        //If cart is empty for particular user and order is not placed
        else {
            
            //showing empty cart screen
            emptyCartView.isHidden = false
            
            //Hidding order screen button
            orderBtn.isHidden = true
        }
    }
    
    //MARK: Number of rows function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cartItem.count
    }
    
    //MARK: Cell for row function
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = cartTableView.dequeueReusableCell(withIdentifier: "cartItems", for: indexPath) as! CartTableViewCell
        
        item.parentVC = self
        
        item.itemName.text = cartItem[indexPath.row].product_name
        item.itemPrice.text = cartItem[indexPath.row].product_price
        item.itemImage.image = UIImage(data: cartItem[indexPath.row].product_image!)
        
        return item
    }
    
    //MARK: Height for row function
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    //MARK: Add to Bag Button Clicked Navigating to Location Confirmation
    @IBAction func addToBagButtonClicked(_ sender: Any) {
        
        let locationView = self.storyboard?.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
        
        self.navigationController?.pushViewController(locationView, animated: true)
    }
    
    //MARK: Back Segue
    // Coming Back to Cart View
    @IBAction func backToCartPressed(_ segue: UIStoryboardSegue) {

    }
    
    //MARK: Order Button Pressed
    @IBAction func orderBtnPressed(_ sender: Any) {
        
        let order = storyboard?.instantiateViewController(withIdentifier: "OrdersViewController") as! OrdersViewController
        self.navigationController?.pushViewController(order, animated: true)
    }
    
}
