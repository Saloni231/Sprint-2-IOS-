//
//  DBOperations.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 21/09/22.
//

import UIKit
import CoreData

class DBOperations: NSObject {

    //MARK: Instance of DBOperationInstance
    class func dbOperationInstance() -> DBOperations {
        
        struct DBSingleton {
            
            static let dbInstance = DBOperations()
        }
        
        return DBSingleton.dbInstance
    }
    
    //MARK: Inserting Data into User Entity
    func insertDataToUser(name: String, email: String, mobile: String, password: String) {
        
        let managedObject = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        
        let user = User(context: managedObject)

        user.name = name
        user.email = email
        user.mobile = mobile
        user.password = password
        
        do {
            
            try managedObject.save()
        } catch(let error) {
            
            print("Failed to Save Details")
            print(error.localizedDescription)
        }
    }
    
          
    //MARK: Deleting All Records from user entity
    func deleteUserData() {
        
        let managedObjectDelete = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        let request : NSFetchRequest<User> = User.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            
            let records = try managedObjectDelete.fetch(request)
            for r in records {
                managedObjectDelete.delete(r)
            }
            
            do {
                
                try managedObjectDelete.save()
            } catch(let error) {
                print(error.localizedDescription)
            }
        } catch(let error){
            print(error.localizedDescription)
        }
    }
    
    
    //MARK: Fetching a particular record from User Entity
    func fetchMatchedRecord(email: String) -> User? {
        
        let managedObjectModel = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        let reqPredicate = NSPredicate(format: "email MATCHES %@", email)
        request.predicate = reqPredicate
        
        do {
            
            let record = try managedObjectModel.fetch(request)
            if(record.isEmpty){
                return nil
            }
            else{
                return record[0]
            }
        } catch(_) {
            
            fatalError("Failed to fetch record.")
        }
    }
    
    // Saving new password
    func newPassword(email: String, password: String) {
        
        let managedObjectPassword = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        let request : NSFetchRequest<User> = User.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        let reqPredicate = NSPredicate(format: "emailID MATCHES %@", email)
        request.predicate = reqPredicate
        
        do{
            let data = try managedObjectPassword.fetch(request)
            for i in 0..<data.count {
                let obj = data[i]
                obj.password = password
            }
            do {
                try managedObjectPassword.save()
            } catch (let error) {
                print(error.localizedDescription)
            }
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
    
    //MARK: Inserting data into cart entity
    func insertDataToCart(userEmail: String, productName: String, productImage: Data, productDesc: String) {
        
        let managedObject = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        
        let cart = Cart(context: managedObject)
        
        cart.user_email = userEmail
        cart.product_name = productName
        cart.product_image = productImage
        cart.product_desecription = productDesc
        cart.is_order_Placed = false
        
        do {
            
            try managedObject.save()
        } catch(let error) {
            
            print("Failed to add to cart")
            print(error.localizedDescription)
        }
    }
    
    //MARK: Fetching Data from Cart Entity
    func fetchCartRecord(userEmail: String) -> [Cart]? {
        
        let managedObjectModel = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        let request: NSFetchRequest<Cart> = Cart.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        let reqPredicateEmail = NSPredicate(format: "user_email MATCHES %@", userEmail)
        let reqPredicateOrder = NSPredicate(format: "is_order_Placed == false")
        
        let reqPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [reqPredicateEmail,reqPredicateOrder])
        request.predicate = reqPredicate
        
        do {
            
            let record = try managedObjectModel.fetch(request)
            if(record.isEmpty){
                return nil
            }
            else{
                return record
            }
        } catch(_) {
            
            fatalError("Failed to fetch record.")
        }
    }
    
    //MARK: Deleting All Records from cart entity
    func deleteCartData() {
        
        let managedObjectDelete = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        let request : NSFetchRequest<Cart> = Cart.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            
            let records = try managedObjectDelete.fetch(request)
            for r in records {
                managedObjectDelete.delete(r)
            }
            
            do {
                
                try managedObjectDelete.save()
            } catch(let error) {
                print(error.localizedDescription)
            }
        } catch(let error){
            print(error.localizedDescription)
        }
    }
    
    //MARK: Removing Item from cart entity
    func removeItemFromCart(productName: String) {
        
        let managedObject = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        
        let request: NSFetchRequest<Cart> = Cart.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        let reqPredicate = NSPredicate(format: "product_name MATCHES %@", productName)
        request.predicate = reqPredicate
        
        do {
            
            let records = try managedObject.fetch(request)
            managedObject.delete(records[0])
            
            do {
                
                try managedObject.save()
            } catch(let error) {
                
                print(error.localizedDescription)
            }
        } catch(let error) {
            
            print(error.localizedDescription)
        }
    }
    
    //MARK: Implementing Placing Order Functionality
    func orderPlaced(userEmail: String) {
        
        let managedObject = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        
        let request : NSFetchRequest<Cart> = Cart.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        let reqPredicate = NSPredicate(format: "user_email MATCHES %@", userEmail)
        request.predicate = reqPredicate
        
        do {
            
            let record = try managedObject.fetch(request)
            
            for item in record {
                
                item.is_order_Placed = true
            }
            
            do {
                
                try managedObject.save()
            } catch (let error) {
                
                print(error.localizedDescription)
            }
        } catch (let error) {
            
            print(error.localizedDescription)
        }
    }
}
