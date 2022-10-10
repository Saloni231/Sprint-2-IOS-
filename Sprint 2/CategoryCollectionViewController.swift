//
//  CategoryCollectionViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 04/10/22.
//

import UIKit
import Alamofire

class CategoryCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: Variable Decleration
    var categories = NSMutableArray()
    
    //MARK: Outlet Connection
    @IBOutlet weak var CategoriesCollection: UICollectionView!
    
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        CategoriesCollection.register(UINib(nibName: "CategoryTitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryTitle")
        
    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        
        //Showing Hidden tab bar
        self.tabBarController?.tabBar.isHidden = false
        
        //Calling function
        jsonApiCall()
    }
    
    //MARK: API call for Categories
    func jsonApiCall() {
        
        CategoriesCollection.isHidden = true
        loadingActivity.startAnimating()
        
        Alamofire.request("https://dummyjson.com/products/categories").responseJSON(completionHandler: {
            response in
            
            if let result = response.result.value {
                
                self.categories = NSMutableArray()
                
                for title in result as! NSArray {
                    
                    self.categories.add(title as! String)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                    
                    self.CategoriesCollection.delegate = self
                    self.CategoriesCollection.dataSource = self
                    self.CategoriesCollection.isHidden = false
                    self.loadingActivity.stopAnimating()
                }
            }
        })
    }
    
    //MARK: Back Segue
    // Coming Back to category View
    @IBAction func backToCategoryPressed(_ segue: UIStoryboardSegue) {
        
    }
    
}

extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    //MARK: Number of Section Function
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    //MARK: Cell For Item Function
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let category = CategoriesCollection.dequeueReusableCell(withReuseIdentifier: "categoryTitle", for: indexPath) as! CategoryTitleCollectionViewCell
        
        category.titleName.text = (categories[indexPath.row] as? String)?.capitalized
        
        category.titleImage.image = UIImage(named: (categories[indexPath.row] as? String)!)
        category.titleImage.layer.cornerRadius = 75
        
        return category
    }
    
    //MARK: Size for each cell function
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 190.0, height: 230.0)
    }
    
    //MARK: Did Select Item Function
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let categoryDescription = self.storyboard?.instantiateViewController(withIdentifier: "CategoryDescriptionViewController") as! CategoryDescriptionViewController
        categoryDescription.itemTitle = (categories[indexPath.row] as? String)?.capitalized
        self.navigationController?.pushViewController(categoryDescription, animated: true)
        
    }
}
