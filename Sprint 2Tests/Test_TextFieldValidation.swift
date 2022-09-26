//
//  Test_TextFieldValidation.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
@testable import Sprint_2

class Test_TextFieldValidation: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    //MARK: Test Case For Name Validation
    func testNameField() throws {
        
        XCTAssert(TextFieldValidation.nameValidation("Saloni"), "Name is not Valid")
        XCTAssertFalse(TextFieldValidation.nameValidation("1234"),"Name is valid")
        XCTAssertFalse(TextFieldValidation.nameValidation("sal@"), "Name is not Valid")
        XCTAssertFalse(TextFieldValidation.nameValidation("sal"), "Name is valid")
    }
    
    //MARK: Test Case For Email Validation
    func testEmailField() throws {
        
        XCTAssertTrue(TextFieldValidation.emailValidation("saloni@gmail.com"), "Email Id is not valid")
        XCTAssertFalse(TextFieldValidation.emailValidation("saloni.com"), "Email Id is valid")
        XCTAssertFalse(TextFieldValidation.emailValidation("@gmail.com"), "Email Id is valid")
        XCTAssertFalse(TextFieldValidation.emailValidation("saloni"), "Email Id is valid")
    }
    
    //MARK: Test Case For Mobile Validation
    func testMobileField() throws {
        
        XCTAssert(TextFieldValidation.mobileValidation("1234567890"), "Mobile is not valid")
        XCTAssertFalse(TextFieldValidation.mobileValidation("123456789"), "Mobile is valid")
        XCTAssertFalse(TextFieldValidation.mobileValidation("12345678901"), "Mobile is valid")
    }
    
    //MARK: Test Case For Password Validation
    func testPasswordField() throws {
        
        XCTAssertTrue(TextFieldValidation.passwordValidation("Abcd@1"), "Password is not valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("abcdef"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("Abcde1"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("Abcde@"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("abcd@1"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("123456"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("1234Af"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("1234A@"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("1234f@"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("@#$%*@"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("@#$%s1"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("@#$%As"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("@#$%S1"), "Password is valid")
        XCTAssertFalse(TextFieldValidation.passwordValidation("a@s1"), "Password is valid")
        
    }
    
    //MARK: Test Case For Confirm Password Validation
    func testConfirmPasswordField() throws {
        
        XCTAssertTrue(TextFieldValidation.confirmPasswordValidation("Abcd@1", "Abcd@1"), "Confirm password does not match with password")
        XCTAssertFalse(TextFieldValidation.confirmPasswordValidation("Abcd@1", "Abcde1"), "Confirm password is valid")
        XCTAssertFalse(TextFieldValidation.confirmPasswordValidation("Abcde1", "Abcde1"), "Confirm Password is valid")
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }

}
