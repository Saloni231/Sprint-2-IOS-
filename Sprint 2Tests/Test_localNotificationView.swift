//
//  Test_localNotificationView.swift
//  Sprint 2Tests
//
//  Created by Capgemini-DA078 on 25/09/22.
//

import XCTest
@testable import Sprint_2

class Test_localNotificationView: XCTestCase {
    
    //MARK: Variable Decleration
    var localNotifi : LocalNotificationViewController!

    override func setUpWithError() throws {
        
        //MARK: Local Notification View
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        localNotifi = storyBoard.instantiateViewController(withIdentifier: "LocalNotificationViewController") as? LocalNotificationViewController
        localNotifi.loadViewIfNeeded()
    }
    
    //MARK: Testing Local Notification View
    func testLocalNotification() throws {
        
        //local notification button
        XCTAssertNotNil(localNotifi.localNotifiButton, "local Notification has no outlet connection")
        
        //local notification action
        let localNotifiAction = try XCTUnwrap(localNotifi.localNotifiButton.actions(forTarget: localNotifi, forControlEvent: .touchUpInside), "Local Notification Button has no action for touch up inside")
        XCTAssertEqual(localNotifiAction.first, "localNotifiBtnClicked:", "There is no action assigned on local notification button for touch up inside")
        
        //back to categories button
        XCTAssertNotNil(localNotifi.backToCategory, "back to category button has no outlet connection")
        
        
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
