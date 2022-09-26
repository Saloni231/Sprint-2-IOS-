//
//  User+CoreDataProperties.swift
//  
//
//  Created by Capgemini-DA078 on 25/09/22.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var mobile: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var user_to_cart: NSSet?

}

// MARK: Generated accessors for user_to_cart
extension User {

    @objc(addUser_to_cartObject:)
    @NSManaged public func addToUser_to_cart(_ value: Cart)

    @objc(removeUser_to_cartObject:)
    @NSManaged public func removeFromUser_to_cart(_ value: Cart)

    @objc(addUser_to_cart:)
    @NSManaged public func addToUser_to_cart(_ values: NSSet)

    @objc(removeUser_to_cart:)
    @NSManaged public func removeFromUser_to_cart(_ values: NSSet)

}

extension User : Identifiable {

}
