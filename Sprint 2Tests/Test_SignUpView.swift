//
//  Test_SignUpView.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
@testable import Sprint_2

class Test_SignUpView: XCTestCase {

    //MARK: Variable Decleration
    var signUp : SignUpViewController!
    
    override func setUpWithError() throws {
        
        //MARK: Sign Up View
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        signUp = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        signUp.loadViewIfNeeded()
    }
    
    //MARK: Testing Name Text Field
    func testNameTextField() throws {
        
        let name = try XCTUnwrap(signUp.nameTextField, "Name Text Field has no connection.")
        
        let nameEditingChanged = try XCTUnwrap(name.actions(forTarget: signUp, forControlEvent: .editingChanged), "Name Text field has no action for editing changed")
        XCTAssertEqual(nameEditingChanged.first, "nameCheck:", "There is no action assigned on name text field for editing changed")
        
        let nameEditingDidEnd = try XCTUnwrap(name.actions(forTarget: signUp, forControlEvent: .editingDidEnd), "Name Text field has no action for editing did end")
        XCTAssertEqual(nameEditingDidEnd.first, "nameValidation:", "There is no action assigned on name text field for editing did end")
    }
    
    //MARK: Testing Name Error Message
    func testNameErrorLabel() throws {
        
        XCTAssertNotNil(signUp.nameErrorMsg, "Name Error Lable has no connection")
        
        XCTAssert(signUp.nameErrorMsg.isHidden, "Name Error is not hidden")
    }
    
    //MARK: Testing Email Text Field
    func testEmailTextField() throws {
        
        let email = try XCTUnwrap(signUp.emailTextField, "Email Text Field has no connection.")
        
        let emailEditingDidBegin = try XCTUnwrap(email.actions(forTarget: signUp, forControlEvent: .editingDidBegin), "Email Text field has no action for editing did begin")
        XCTAssertEqual(emailEditingDidBegin.first, "emailRules:", "There is no action assigned on email text field for editing did begin")
        
        let emailEditingDidEnd = try XCTUnwrap(email.actions(forTarget: signUp, forControlEvent: .editingDidEnd), "Email Text field has no action for editing did End")
        XCTAssertEqual(emailEditingDidEnd.first, "emailValidation:", "There is no action assigned on email text field for editing did End")
        
        let emailEditingChanged = try XCTUnwrap(email.actions(forTarget: signUp, forControlEvent: .editingChanged), "Email Text field has no action for editing changed")
        XCTAssertEqual(emailEditingChanged.first, "emailCheck:", "There is no action assigned on email text field for editing changed")
    }
    
    //MARK: Testing Email Error Message
    func testEmailErrorLabel() throws {
        
        XCTAssertNotNil(signUp.emailErrorMsg, "Email Error Lable has no connection")
        
        XCTAssert(signUp.emailErrorMsg.isHidden, "Email Error is not hidden")
    }

    //MARK: Testing Mobile Text Field
    func testMobileTextField() throws {
        
        let mobile = try XCTUnwrap(signUp.mobileTextField, "Mobile Text Field has no connection.")
        
        let mobileEditingDidBegin = try XCTUnwrap(mobile.actions(forTarget: signUp, forControlEvent: .editingDidBegin), "Mobile Text field has no action for editing did begin")
        XCTAssertEqual(mobileEditingDidBegin.first, "mobileRules:", "There is no action assigned on mobile text field for editing did begin")
        
        let mobileEditingDidEnd = try XCTUnwrap(mobile.actions(forTarget: signUp, forControlEvent: .editingDidEnd), "Mobile Text field has no action for editing did End")
        XCTAssertEqual(mobileEditingDidEnd.first, "mobileValidation:", "There is no action assigned on mobile text field for editing did End")
        
        let mobileEditingChanged = try XCTUnwrap(mobile.actions(forTarget: signUp, forControlEvent: .editingChanged), "Mobile Text field has no action for editing changed")
        XCTAssertEqual(mobileEditingChanged.first, "mobileCheck:", "There is no action assigned on mobile text field for editing changed")
    }
    
    //MARK: Testing Mobile Error Message
    func testMobileErrorLabel() throws {
        
        XCTAssertNotNil(signUp.mobileErrorMsg, "Mobile Error Lable has no connection")
        
        XCTAssert(signUp.mobileErrorMsg.isHidden, "Mobile Error is not hidden")
    }
    
    //MARK: Testing Password Text Field
    func testPasswordTextField() throws {
        
        let password = try XCTUnwrap(signUp.passwordTextField, "Password Text Field has no connection.")
        
        let passwordEditingDidBegin = try XCTUnwrap(password.actions(forTarget: signUp, forControlEvent: .editingDidBegin), "Password Text field has no action for editing did begin")
        XCTAssertEqual(passwordEditingDidBegin.first, "passwordRules:", "There is no action assigned on password text field for editing did begin")
        
        let passwordEditingDidEnd = try XCTUnwrap(password.actions(forTarget: signUp, forControlEvent: .editingDidEnd), "Password Text field has no action for editing did End")
        XCTAssertEqual(passwordEditingDidEnd.first, "passwordValidation:", "There is no action assigned on password text field for editing did End")
        
        let passwordEditingChanged = try XCTUnwrap(password.actions(forTarget: signUp, forControlEvent: .editingChanged), "Password Text field has no action for editing changed")
        XCTAssertEqual(passwordEditingChanged.first, "passwordCheck:", "There is no action assigned on password text field for editing changed")
    }
    
    //MARK: Testing Password Error Message
    func testPasswordErrorLabel() throws {
        
        XCTAssertNotNil(signUp.passwordErrorMsg, "Password Error Lable has no connection")
        
        XCTAssert(signUp.passwordErrorMsg.isHidden, "Password Error is not hidden")
    }

    //MARK: Testing Confirm Password Text Field
    func testConfirmPasswordTextField() throws {
        
        let confirmPassword = try XCTUnwrap(signUp.confirmPasswordTextField, "Confirm password Text Field has no connection.")
        
        let confirmPasswordEditingDidBegin = try XCTUnwrap(confirmPassword.actions(forTarget: signUp, forControlEvent: .editingDidBegin), "Confirm Password Text field has no action for editing did begin")
        XCTAssertEqual(confirmPasswordEditingDidBegin.first, "confirmPasswordRules:", "There is no action assigned on confirm password text field for editing did begin")
        
        let confirmPasswordEditingDidEnd = try XCTUnwrap(confirmPassword.actions(forTarget: signUp, forControlEvent: .editingDidEnd), "Confirm Password Text field has no action for editing did End")
        XCTAssertEqual(confirmPasswordEditingDidEnd.first, "confirmPasswordValidation:", "There is no action assigned on confirm password text field for editing did End")
        
        let confirmPasswordEditingChanged = try XCTUnwrap(confirmPassword.actions(forTarget: signUp, forControlEvent: .editingChanged), "Confirm Password Text field has no action for editing changed")
        XCTAssertEqual(confirmPasswordEditingChanged.first, "confirmPasswordCheck:", "There is no action assigned on confirm password text field for editing changed")
    }
    
    //MARK: Testing Confirm Password Error Message
    func testConfirmPasswordErrorLabel() throws {
        
        XCTAssertNotNil(signUp.confirmPasswordErrorMsg, "Confirm Password Error Lable has no connection")
        
        XCTAssert(signUp.confirmPasswordErrorMsg.isHidden, "Confirm Password Error is not hidden")
    }
    
    
    //MARK: Testing Sign Up Button
    func testSignUpButton() throws {
        
        let signUpBtn = try XCTUnwrap(signUp.signUpButton, "Sign Up Button has no connection")
        
        let signUpBtnAction = try XCTUnwrap(signUpBtn.actions(forTarget: signUp, forControlEvent: .touchUpInside), "Sign Up Button has no action for touch up inside")
        XCTAssertEqual(signUpBtnAction.first, "signUpButtonClicked:", "There is no action assigned on sign up button for touch up inside")
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
