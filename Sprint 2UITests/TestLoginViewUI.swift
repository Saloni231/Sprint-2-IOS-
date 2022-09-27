//
//  TestLoginViewUI.swift
//  Sprint 2UITests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
import Sprint_2

class TestLoginViewUI: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false

        XCUIApplication().launch()

    }
    
    //MARK: Testing Login View UI
    func testLoginView() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Email ID"].tap()
        app.textFields["Email ID"].typeText("john@gmail.com")
        
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("John@1")
        
        app.swipeUp()
        
        app.buttons["Login"].tap()
        
        
        //MARK: Categories View
        XCTAssert(app.staticTexts["Categories"].exists, "Failed to load categories view")
        
        //MARK: Testing Categories Description
        //Adding laptop to cart
        app.staticTexts["Laptops"].tap()
        
        XCTAssert(app.staticTexts["Laptops"].exists, "Failed to load categories description view")
        
        app.collectionViews.cells.containing(.staticText, identifier: "Macbook Pro").buttons["shopping cart"].tap()
        
        //MARK: Item Added to cart Alert choosing continue shopping option
        XCTAssert(app.alerts.staticTexts["Success!!"].exists, "Failed to load alert")
        
        app.alerts.buttons["Continue Shopping"].tap()
        
        app.buttons["chevron.backward.2"].tap()
                
        
        //Adding smartphone to cart
        app.staticTexts["Smartphones"].tap()
                
        XCTAssert(app.staticTexts["Smartphones"].exists, "Failed to load categories description view")
        
        app.collectionViews.cells.containing(.staticText, identifier: "Iphone 9").buttons["shopping cart"].tap()
        
        //MARK: Item Added to cart alert choosing Go To Cart
        XCTAssert(app.alerts.staticTexts["Success!!"].exists,"Failed to load alert")
        
        app.alerts.buttons["Go To Cart"].tap()
        
        //MARK: Cart View
        XCTAssert(app.staticTexts["My Cart"].exists, "Failed to load cart view")
        
        app.cells.buttons["trash"].firstMatch.tap()
                
        app.buttons["ADD TO BAG"].tap()
        
        //MARK: Loaction View
        XCTAssert(app.staticTexts["Confirm Location"].exists, "Failed to load location view")
        
        app.staticTexts["ITEMS SELECTED"].swipeUp()
        
        app.buttons["PLACE ORDER"].tap()
        
        //MARK: Local Notification View
        XCTAssert(app.buttons["Local Notification"].exists, "Failed to load local notification view")
        
        app.buttons["Local Notification"].tap()
        
        app.staticTexts["  Categories"].tap()
        
        XCTAssert(app.staticTexts["Categories"].exists, "Failed to load categories view")
        
        app.tabBars["Tab Bar"].buttons["Cart"].tap()
        
        
        XCTAssert(app.images["emptyCart.gif"].exists, "Failed to load empty cart screen")
        
        //MARK: Order View
        app.buttons["Order"].tap()
        
        XCTAssert(app.staticTexts["My Order"].exists, "Failed to load order view")
        
        
        
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        
    }

}
