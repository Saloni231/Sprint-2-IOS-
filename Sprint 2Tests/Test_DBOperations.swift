//
//  Test_DBOperations.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
@testable import Sprint_2

class Test_DBOperations: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    //MARK: Testing Insert Data to User Entity
    func testInsertData() throws {
        
        DBOperations.dbOperationInstance().insertDataToUser(name: "Saloni", email: "saloni@gmail.com", mobile: "9087906534", password: "Saloni@1")
        let record = DBOperations.dbOperationInstance().fetchMatchedRecord(email: "saloni@gmail.com")
        
        XCTAssertEqual(record?.name, "Saloni", "Data Not stored Sucessfully")
        XCTAssertEqual(record?.email, "saloni@gmail.com", "Data Not stored Sucessfully")
        XCTAssertEqual(record?.mobile, "9087906534", "Data Not stored Sucessfully")
        XCTAssertEqual(record?.password, "Saloni@1", "Data Not stored Sucessfully")
        
    }
    
    //MARK: Testing Delete all record from User Entity
    func testDeleteAllRecord() throws {
        
        DBOperations.dbOperationInstance().deleteUserData()
        
        XCTAssertEqual(DBOperations.dbOperationInstance().fetchMatchedRecord(email: "saloni@gmail.com"), nil, "Records are not deleted")
    }
    
    //MARK: Testing Inserting Data to Cart Entity
    func testInsertDataToCart() throws {
        
        DBOperations.dbOperationInstance().insertDataToCart(userEmail: "saloni@gmail.com", productName: "smartphones", productImage: ((UIImage(named: "smartphones.jpeg"))?.pngData())!, productDesc: "Iphones, Android")
        
        let record = DBOperations.dbOperationInstance().fetchCartRecord(userEmail: "saloni@gmail.com")
        
        XCTAssertEqual(record!.last!.user_email, "saloni@gmail.com", "Data Not Stored")
        
        XCTAssertEqual(record!.last!.product_name, "smartphones", "Data Not Stored")
        
        XCTAssertEqual(record!.last!.product_desecription, "Iphones, Android", "Data Not Stored")
        
        XCTAssertEqual(record!.last!.product_image, UIImage(named: "smartphones.jpeg")?.pngData(), "Data Not Stored")
        
    }
    
    //MARK: Testing Delete All Record from cart entity
    func testDeleteAllRecordCart() throws {
        
        DBOperations.dbOperationInstance().deleteCartData()
        
        let record = DBOperations.dbOperationInstance().fetchCartRecord(userEmail: "saloni@gmail.com")
        
        XCTAssertEqual(record, nil, "Data is not deleted")
    }
    
    //MARK: Testing removing item from cart
    func testRemoveItemFromCart() throws {
        
        DBOperations.dbOperationInstance().removeItemFromCart(productName: "smartphones")
        
        let record = DBOperations.dbOperationInstance().fetchCartRecord(userEmail: "saloni@gmail.com")
        
        XCTAssertEqual(record, nil, "Data is not deleted")
    }
    
    //MARK: Testing Order Placed Functionality
    func testOrderPlaced() throws {
        
        DBOperations.dbOperationInstance().orderPlaced(userEmail: "saloni@gmail.com")
        
        let record = DBOperations.dbOperationInstance().fetchCartRecord(userEmail: "saloni@gmail.com")
        
        XCTAssertEqual(record?.last?.is_order_Placed, nil,"Order  is not Placed")
    }
    
    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }

}
