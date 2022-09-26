//
//  Test_KeyChainOperation.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
@testable import Sprint_2

class Test_KeyChainOperation: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    //MARK: Testing keychain save
    func testSaveKeyChain() throws {
        
        XCTAssertTrue((KeyChainOperations.saveKey(key: "saloni@gmail.com", password: Data("Saloni@1".utf8)) == 0), "Saving keychain failed")
    }
    
    //MARK: Testing keychain reterive
    func testRetrieveKeyChain() throws {
        
        XCTAssertNotNil(KeyChainOperations.reteriveKey(key: "saloni@gmail.com"), "Failed to reterive key chain")
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }

}
