//
//  Test_OrderView.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 26/09/22.
//

import XCTest
@testable import Sprint_2

class Test_OrderView: XCTestCase {
    
    //MARK: Variable Decleration
    var order : OrdersViewController!
    var orderCell: PlacedOrderTableCell!
    
    override func setUpWithError() throws {
        
        //MARK: Order View
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        order = storyBoard.instantiateViewController(withIdentifier: "OrdersViewController") as? OrdersViewController
        order?.loadViewIfNeeded()
        
        //MARK: order cell view
        orderCell = order.placedOrderTable.dequeueReusableCell(withIdentifier: "placedOrder") as? PlacedOrderTableCell
        orderCell.inputViewController?.loadViewIfNeeded()
         
    }
    
    //MARK: Testing Order view
    func testOrderView() throws {
        
        //Order Table View
        XCTAssertNotNil(order.placedOrderTable, "Table view has no outlet connnection")
        
        //item image
        XCTAssertNotNil(orderCell.itemImage, "Item Image has no outlet connection")
        
        //item name
        XCTAssertNotNil(orderCell.itemName, "Item Name has no outlet connection")
        
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }

}
