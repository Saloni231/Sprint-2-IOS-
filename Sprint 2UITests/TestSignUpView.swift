//
//  TestSignUpView.swift
//  Sprint 2UITests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest

class TestSignUpView: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false

        XCUIApplication().launch()
        
    }
    
    //MARK: Test Sign Up View
    func testSignUpView() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Sign Up"].tap()
        
        XCTAssert(app.staticTexts["Sign Up"].exists, "Failed to load sign up view")
        
        XCTAssert(app.textFields["Name"].exists, "Failed to load name text field")
        XCTAssert(app.textFields["Email ID"].exists, "Failed to load email text field")
        XCTAssert(app.textFields["Mobile"].exists, "Failed to load mobile text field")
        XCTAssert(app.secureTextFields["Password"].exists, "Failed to load password text field")
        XCTAssert(app.secureTextFields["Confirm Password"].exists, "Failed to load confirm password text field")
        XCTAssert(app.buttons["Sign Up"].exists, "Failed to load sign up button")
        
        app.swipeUp()
        
        
        app.textFields["Name"].tap()
        app.textFields["Name"].typeText("John")
        
        app.textFields["Email ID"].tap()
        XCTAssert(app.staticTexts["Email ID should be in valid Format. E.g. abc@domain.com"].exists, "Failed")
        app.textFields["Email ID"].typeText("john@gmail.com")
        
        app.textFields["Mobile"].tap()
        XCTAssert(app.staticTexts["Mobile Number should be 10 digit number. E.g. 1234567890"].exists, "Failed")
        app.textFields["Mobile"].typeText("9087665434")
        
        app.secureTextFields["Password"].tap()
        
        app.secureTextFields["Password"].typeText("John@1")
        
        app.secureTextFields["Confirm Password"].tap()
        XCTAssert(app.staticTexts["Should be same as password"].exists, "Failed")
        app.secureTextFields["Confirm Password"].typeText("John@1")
        
        app.buttons["Sign Up"].tap()
        
        //MARK: Sign Up Button alert
        XCTAssert(app.alerts.staticTexts["Sign Up Success!!"].exists,"Failed")
        app.alerts.buttons["Okay"].tap()
        
        XCTAssert(app.staticTexts["Categories"].exists, "Failed")
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
    
    }

}
