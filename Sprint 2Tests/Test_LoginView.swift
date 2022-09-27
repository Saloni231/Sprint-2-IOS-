//
//  Test_LoginView.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
@testable import Sprint_2

class Test_LoginView: XCTestCase {
    
    //MARK: Variable Decleration
    var login : LoginViewController!

    override func setUpWithError() throws {
        
        //MARK: Login View Controller
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        login = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        login.loadViewIfNeeded()
    }
    
    //MARK: Testing Username Field
    func testUsernameFieldUi() throws {
        
        let email : UITextField = try XCTUnwrap(login.usernameTextField, "Email Field has no outlet connection")
        
        let emailActionEditingEnd = try XCTUnwrap(email.actions(forTarget: login, forControlEvent: .editingDidEnd), "Email Text Field has no action for editing did end")
        XCTAssertEqual(emailActionEditingEnd.first, "usernameValidation:", "There is no action assigned on email text field for editing did end")
        
        let emailActionEditingChanged = try XCTUnwrap(email.actions(forTarget: login, forControlEvent: .editingChanged), "Email Text Field has no action for editing changed")
        XCTAssertEqual(emailActionEditingChanged.first, "usernameCheck:", "There is no action assigned on email text field for editing changed")
        
        XCTAssertEqual(email.placeholder, "Email ID", "Wrong Placeholder")
        
        XCTAssertEqual(email.text, "", "Email Text Field is not empty")
    }
    
    //MARK: Testing Password Text Field
    func testPasswordFieldUi() throws {
        
        
        let password : UITextField = try XCTUnwrap(login.passwordTextField, "Password Field has no outlet connection")
        
        let passwordEditingChanged = try XCTUnwrap(password.actions(forTarget: login, forControlEvent: .editingChanged), "Password Text Field has no action for editing changed")
        
        XCTAssertEqual(passwordEditingChanged.first, "passwordTyped:", "There is no action assigned on password text field for editing changed")
    }
    
    //MARK: Testing Username Error Msg
    func testEmailErrorLabel() throws {
        
        XCTAssertNotNil(login.usernameErrorMsg, "Email Error Label has no outlet Connection")
        
        XCTAssert(login.usernameErrorMsg.isHidden, "Email Error label is not hidden")
    }
    
    //MARK: Testing Password Error Msg
    func testPasswordErrorLabel() throws {
        
        XCTAssertNotNil(login.passwordErrorMsg, "Password Error label has no outlet connection")
        
        XCTAssert(login.passwordErrorMsg.isHidden, "Password Error label is not hidden")
    }
    
    //MARK: Testing Login Button
    func testLoginButton() throws {
        
        let loginBtn = try XCTUnwrap(login.loginButton, "Login Button has no outlet connection")
        let loginBtnPressed = try XCTUnwrap(loginBtn.actions(forTarget: login, forControlEvent: .touchUpInside), "Login Button has no action assigned to it")
        XCTAssertEqual(loginBtnPressed.first, "loginButtonPressed:", "There is no action assigned on login button")
    }
    
    func testSignUpButton() throws {
        
        let signUpBtn = try XCTUnwrap(login.signUpButton, "Sign Up Button has no outlet connection")
        let signUpBtnPressed = try XCTUnwrap(signUpBtn.actions(forTarget: login, forControlEvent: .touchUpInside), "Sign up button has no action assigned to it")
        XCTAssertEqual(signUpBtnPressed.first, "signUpButtonClicked:", "There is no action assigned on sign up button")
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
