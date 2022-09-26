//
//  Test_CartView.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
@testable import Sprint_2

class Test_CartView: XCTestCase {
    
    //MARK: Variable Decleration
    var cart : CartViewController!
    var cartCell: CartTableViewCell!

    override func setUpWithError() throws {
        
        //MARK: Cart View
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        cart = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController
        cart.loadViewIfNeeded()
        
        //MARK: Cart View Cell
        let bundle = Bundle(for: CartTableViewCell.self)
        cartCell = bundle.loadNibNamed("CartTableViewCell", owner: nil)?.last as? UITableViewCell as? CartTableViewCell
        cartCell.inputViewController?.loadViewIfNeeded()
        
    }
    
    //MARK: Testing Cart View
    func testCartView() throws {
        
        //cart page title
        XCTAssertNotNil(cart.cartTitle, "Title has no outlet connection")
        
        //cart table view
        XCTAssertNotNil(cart.cartTableView, "Table view has not outlet connection")
        
        //cart Add to bag button
        XCTAssertNotNil(cart.addToBagBtn, "Add to bag button has no outlet connection")
        
        //cart Add to bag action
        let addToBagAction = try XCTUnwrap(cart.addToBagBtn.actions(forTarget: cart, forControlEvent: .touchUpInside), "Add to Bag Button has no action for touch up inside")
        XCTAssertEqual(addToBagAction.first, "addToBagButtonClicked:", "There is no action assigned on add to bag button for touch up inside")
        
        //cart empty cart view
        XCTAssertNotNil(cart.emptyCartView, "Empty cart view has no outlet connection")
        
        //cart cell item image
        XCTAssertNotNil(cartCell.itemImage, "Item image has no outlet connection")
        
        //cart cell item name
        XCTAssertNotNil(cartCell.itemName, "Item name has no outlet connection")
        
        //cart cell item description
        XCTAssertNotNil(cartCell.itemDescription, "Item description has no outlet connection")
        
        //cart cell item remove button
        XCTAssertNotNil(cartCell.removeBtn, "Remove Button has no outley connection")
        
        //cart cell item remove button action
        let removeAction = try XCTUnwrap(cartCell.removeBtn.actions(forTarget: cartCell, forControlEvent: .touchUpInside), "Remove Button has no action for touch up inside")
        XCTAssertEqual(removeAction.first, "removeItemClicked:", "There is no action assigned on remove button for touch up inside")
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
