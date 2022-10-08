//
//  CategoryDescriptionViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 22/09/22.
//

import UIKit
import Alamofire

class CategoryDescriptionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: Variable Decleration
    var itemTitle: String?
    
    var itemData = [NSDictionary()]
    
    var thumbNil : UIImage!

    //MARK: Outlet Connection
    @IBOutlet weak var itemPageTitle: UILabel!
    @IBOutlet weak var itemList: UICollectionView!
    
    @IBOutlet weak var backButton: UIButton!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Registering row for collection view
        itemList.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "items")
        
        //Title for Each Category
        if itemTitle != nil {
            
            itemPageTitle.text = itemTitle
        }
        
    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        
        //Hiding bottom bar
        self.tabBarController?.tabBar.isHidden = true
        
        //Function call for fetching data
        callingAPI()
    }
    
    //MARK: JSON API Call through Alamorafire for items
    func callingAPI() {
        
        Alamofire.request("https://dummyjson.com/products/category/" + itemTitle!).responseJSON(completionHandler: { response in
            
            if let record = (response.result.value as? NSDictionary)!["products"] as? NSArray {
                
                for item in record {
                    
                    self.itemData.append((item as? NSDictionary)!)
                }
            }

            DispatchQueue.main.async {
                
                self.itemList.delegate = self
                self.itemList.dataSource = self
            }
        })
    }
    
    //MARK: Back Segue
    // Coming Back to Category Description View
    @IBAction func backToCategoryDescPressed(_ segue: UIStoryboardSegue) {
        
    }

}
extension CategoryDescriptionViewController: UICollectionViewDelegateFlowLayout {
    
    //MARK: Number of rows in section function
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemData.count - 1
    }
    
    //MARK: Cell for row function
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = itemList.dequeueReusableCell(withReuseIdentifier: "items", for: indexPath) as! CategoryCollectionViewCell
        
        //Border for cell
        item.layer.borderWidth = 1
        item.layer.borderColor = UIColor("#063852").cgColor
        
        item.parentVC = self
        
        //Item Name
        item.itemName.text = (itemData[indexPath.row + 1]["title"] as? String)?.capitalized
        
        //Item Price
        item.itemPrice.text = "$ \(String((itemData[indexPath.row + 1]["price"] as? Int)!))"
        
        //Item Description
        item.itemDescription.text = (itemData[indexPath.row + 1]["description"] as? String)?.capitalized

        //API Call for thumbnail
        Alamofire.request(itemData[indexPath.row + 1]["thumbnail"] as! String).responseJSON(completionHandler: { response in
            item.itemImage.image = UIImage(data: response.data!)
        })
        
        return item
    }
    
    //MARK: Size for each cell function
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 190.0, height: 500.0)
    }
    
    //MARK: Did Select row function
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = self.storyboard?.instantiateViewController(withIdentifier: "ProductDescriptionViewController") as! ProductDescriptionViewController
        product.productData = itemData[indexPath.row + 1]
        self.navigationController?.pushViewController(product, animated: true)
    }
}
