//
//  Test_ProductDescription.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 27/09/22.
//

import XCTest
@testable import Sprint_2

class Test_ProductDescription: XCTestCase {
    
    //MARK: Variable Decleration
    var productDescription: ProductDescriptionViewController!

    override func setUpWithError() throws {
        
        //MARK: Product Description View
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        productDescription = storyBoard.instantiateViewController(withIdentifier: "ProductDescriptionViewController") as? ProductDescriptionViewController
        productDescription.loadViewIfNeeded()
        
    }
    
    //MARK: Product Description View
    func testProductDescriptionView() throws {
        
        //product name
        XCTAssertNotNil(productDescription.productName, "Product Name has no outlet connection")
        
        //product brand
        XCTAssertNotNil(productDescription.productBrand, "Product Brand has no outlet connection")
        
        //product description
        XCTAssertNotNil(productDescription.productBrand, "Product Description has no outlet connection")
        
        //product price
        XCTAssertNotNil(productDescription.productBrand, "Product price has no outlet connection")    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }

}
