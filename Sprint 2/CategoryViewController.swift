//
//  CategoryViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 21/09/22.
//

import UIKit
import Alamofire

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Outlet Connection
    @IBOutlet weak var categoryTableView: UITableView!

    @IBOutlet weak var categoryTitle: UILabel!
    
    //MARK: Variable Decleration
    var categories = NSMutableArray()
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering row for table view
        categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "category")
        
        jsonAPICall()

    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = false
        
        // Function call for fetching data
        jsonAPICall()

    }
        
    //MARK: JSON API Call through Alamorafire for categories
    func jsonAPICall() {
        
        Alamofire.request("https://dummyjson.com/products/categories").responseJSON(completionHandler: {
            response in
            if let result = response.result.value {
                
                self.categories = NSMutableArray()
                
                for i in result as! NSArray {
                    self.categories.add(i as! String)
                    
                }
                DispatchQueue.main.async {
                    
                    self.categoryTableView.dataSource = self
                    self.categoryTableView.delegate = self
                    self.categoryTableView.reloadData()
                }
            }
        })
    }
    
    //MARK: Back Segue
    // Coming Back to category View
    @IBAction func backToCategoryPressed(_ segue: UIStoryboardSegue) {
        
    }
}

extension CategoryViewController {
    
    //MARK: Number of rows function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    //MARK: Cell for each row function
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! CategoryTableViewCell
        
        //category name
        cell.categoryName.text = (categories[indexPath.row] as? String)?.capitalized
        
        //category image
        cell.categoryImage.image = UIImage(named: categories[indexPath.row] as? String ?? "smartphones" + ".jpeg")
        
        return cell
    }
    
    //MARK: Height of row function
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120.0
    }
    
    //MARK: Did Select Row Function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let categoryDescription = self.storyboard?.instantiateViewController(withIdentifier: "CategoryDescriptionViewController") as! CategoryDescriptionViewController
        categoryDescription.itemTitle = (categories[indexPath.row] as? String)?.capitalized
        self.navigationController?.pushViewController(categoryDescription, animated: true)
    }
}

