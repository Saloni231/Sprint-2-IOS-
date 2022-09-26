//
//  Test_CategoryListView.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
@testable import Sprint_2

class Test_CategoryListView: XCTestCase {
    
    //MARK: Variable Decleration
    var category: CategoryViewController!
    var categoryCell: CategoryTableViewCell!

    override func setUpWithError() throws {
        
        //MARK: Category View
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        category = storyBoard.instantiateViewController(withIdentifier: "CategoryViewController") as? CategoryViewController
        category.loadViewIfNeeded()
        
        //MARK: Category Table View Cell
        let bundle = Bundle(for: CategoryTableViewCell.self)
        categoryCell = bundle.loadNibNamed("CategoryTableViewCell", owner: nil)?.first as? UITableViewCell as? CategoryTableViewCell
        categoryCell.inputViewController?.loadViewIfNeeded()
        
        
    }
    
    //MARK: Testing Category View
    func testCategoryView() throws {
        
        //Category Title
        XCTAssertNotNil(category.categoryTitle, "Title has no outlet connection")
        
        //Table View
        XCTAssertNotNil(category.categoryTableView, "Table View Has no Outlet Connection")
        
        //Category Name
        XCTAssertNotNil(categoryCell.categoryName, "Name has no outlet connection")
        
        //Category Image
        XCTAssertNotNil(categoryCell.categoryImage, "Image has not outlet connection")
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
