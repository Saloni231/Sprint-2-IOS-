//
//  Cart+CoreDataProperties.swift
//  
//
//  Created by Capgemini-DA078 on 25/09/22.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var is_order_Placed: Bool
    @NSManaged public var product_desecription: String?
    @NSManaged public var product_image: Data?
    @NSManaged public var product_name: String?
    @NSManaged public var user_email: String?
    @NSManaged public var cart_to_user: User?

}

extension Cart : Identifiable {

}
