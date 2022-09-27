//
//  ProductDescriptionViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 27/09/22.
//

import UIKit
import Alamofire

class ProductDescriptionViewController: UIViewController {
    
    //MARK: Variable Decleration
    var productData = NSDictionary()
    
    var imagePath = NSArray()
    
    var images = [UIImage]()
    
    var productImages = UIImageView()
    
    //MARK: Outlet Decleration
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //function call
        fetchData()
    }
    
    //MARK: Fetching data
    func fetchData() {
        
        imagePath = (productData["images"] as? NSArray)!
        
        let count = imagePath.count
        
        for i in 0..<count {
            
            //MARK: API Call For Images
            Alamofire.request(imagePath[i] as! String).responseJSON(completionHandler: {
                response in
                
                self.images.append(UIImage(data: response.data!)!)
            
                //if (i == count-1) {
                    
                    DispatchQueue.main.async {
                        
                        self.displayingData()
                    }
                //}
            })
        }
    }
    
    //MARK: Displaying Data function
    func displayingData() {
        
        //Assigning Values
        productName.text = (productData["title"] as? String)?.capitalized
        productBrand.text = (productData["brand"] as? String)?.capitalized
        productDescription.text = (productData["description"] as? String)?.capitalized
        productPrice.text = "$ \(String((productData["price"] as? Int)!))"
        
        let animateImage = UIImage.animatedImage(with: images, duration: 20)
        productImages = UIImageView(image: animateImage)
        productImages.frame = CGRect(x: 40, y: 20, width: contentView.frame.width-80, height: 400)
        self.contentView.addSubview(productImages)
        
    }

}
