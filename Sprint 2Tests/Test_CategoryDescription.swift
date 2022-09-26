//
//  Test_CategoryDescription.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
@testable import Sprint_2

class Test_CategoryDescription: XCTestCase {
    
    //MARK: Variable Decleration
    var categoryDesc : CategoryDescriptionViewController!
    var categoryDescCell: CategoryCollectionViewCell!

    override func setUpWithError() throws {
        
        //MARK: Category Description
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        categoryDesc = storyBoard.instantiateViewController(withIdentifier: "CategoryDescriptionViewController") as? CategoryDescriptionViewController
        categoryDesc.loadViewIfNeeded()
        
        //MARK: Category Description Collection View Cell
        let bundle = Bundle(for: CategoryCollectionViewCell.self)
        categoryDescCell = bundle.loadNibNamed("CategoryCollectionViewCell", owner: nil)?.last as? UICollectionViewCell as? CategoryCollectionViewCell
        categoryDescCell.inputViewController?.loadViewIfNeeded()
        
    }
    
    //MARK: Testing Category Description View
    func testCategoryDescView() throws {
        
                
        //category back button
        XCTAssertNotNil(categoryDesc.backButton, "Back Button has no outlet connection")

        //category collection view
        XCTAssertNotNil(categoryDesc.itemList, "Collectio view has no outlet connection")
        
        //category collection cell item image
        XCTAssertNotNil(categoryDescCell.itemImage, "Item Image has no outlet connection")
        
        //category collection cell item name
        XCTAssertNotNil(categoryDescCell.itemName, "Item name has no outlet connection")
        
        //category collection cell item description
        XCTAssertNotNil(categoryDescCell.itemDescription, "Item Description has no outlet connection")
        
        //category collection cell add to cart image
        XCTAssertNotNil(categoryDescCell.addToCart, "Add to cart button has no outlet connection")
        
        //category collection cell add to cart action
        let addToCartAction = try XCTUnwrap(categoryDescCell.addToCart.actions(forTarget: categoryDescCell, forControlEvent: .touchUpInside), "Add to Cart Button has no action for touch up inside")
        XCTAssertEqual(addToCartAction.first, "addToCartPressed:", "There is no action assigned on add to cart button for touch up inside")
        
        //category collection cell added to cart image
        XCTAssertNotNil(categoryDescCell.addedToCart, "Added to cart button has no outlet connection")
        
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
