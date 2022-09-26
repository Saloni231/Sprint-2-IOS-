//
//  Test_Location.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
@testable import Sprint_2

class Test_Location: XCTestCase {
    
    //MARK: Variable Decleration
    var location: LocationViewController!
    var orderTableCell: OrderTableViewCell!

    override func setUpWithError() throws {
        
        //MARK: Location View
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        location = storyBoard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
        location.loadViewIfNeeded()
        
        //MARK: Order Table View Cell
        orderTableCell = location.orderTableView.dequeueReusableCell(withIdentifier: "order") as? OrderTableViewCell
        orderTableCell.inputViewController?.loadViewIfNeeded()

    }
    
    //MARK: Testing Location View and Order Table
    func testLocationView() throws {
        
        // map view
        XCTAssertNotNil(location.locationMapView, "Map view has no outlet connection")
        
        // order table view
        XCTAssertNotNil(location.orderTableView, "order table view has no outlet connection")
        
        // place order button
        XCTAssertNotNil(location.placeOrderButton, "Place order Button has no outlet connection")
        
        //place order action
        let placeOrderAction = try XCTUnwrap(location.placeOrderButton.actions(forTarget: location, forControlEvent: .touchUpInside), "Place order Button has no action for touch up inside")
        XCTAssertEqual(placeOrderAction.first, "placeOrderButtonClicked:", "There is no action assigned on place order button for touch up inside")
        
        // order table cell item name
        XCTAssertNotNil(orderTableCell.itemName, "Item name has no outlet connection")
        
        //order table cell item image
        XCTAssertNotNil(orderTableCell.itemImage, "Item image has no outlet connection")
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
