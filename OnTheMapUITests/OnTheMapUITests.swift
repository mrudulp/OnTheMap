//
//  OnTheMapUITests.swift
//  OnTheMapUITests
//
//  Created by Mrudul Pendharkar on 21/12/15.
//  Copyright © 2015 ShreeVed. All rights reserved.
//

import XCTest

class OnTheMapUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCUIDevice.sharedDevice().orientation = .FaceUp
        XCUIDevice.sharedDevice().orientation = .FaceUp
        
        let app = XCUIApplication()
        app.buttons["Login"].tap()
        
       // app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.tap()
        //app.otherElements["Michal Tubis"].tap()
        let label = app.tabBars.buttons["List"]
        let exists = NSPredicate(format: "exists == true")
        expectationForPredicate(exists, evaluatedWithObject: label, handler: nil)
//       app.otherElements["Michal Tubis"].tap()
        waitForExpectationsWithTimeout(25, handler: nil)
        let tabBarsQuery = app.tabBars
        let listButton = tabBarsQuery.buttons["List"]
        listButton.tap()
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        tabBarsQuery.buttons["Map"].tap()
        listButton.tap()
        
    }
    
}
