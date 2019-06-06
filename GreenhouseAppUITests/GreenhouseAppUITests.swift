//
//  GreenhouseAppUITests.swift
//  GreenhouseAppUITests
//
//  Created by Elizaveta on 5/31/19.
//

import XCTest

class GreenhouseAppUITests: XCTestCase {

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInterface() {
        
        let app = XCUIApplication()
        app.textFields["Login"].tap()
        app.textFields["Login"].typeText("user1")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("111")
        
                
                
//        let labelFail = app.
        
        
        
        let switchAccess = app.switches["switchAccess"]
        switchAccess.tap()
        
        let enterButton = app.buttons["Enter"]
        enterButton.tap()
 
        app.buttons["Your orders"].tap()
        app.buttons["Order"].tap()
        
        let makeOrderAlert = app.alerts["Make order"]
        let collectionViewsQuery = makeOrderAlert.collectionViews
        let enterPhoneNumberTextField = collectionViewsQuery.textFields["Enter phone number"]
        enterPhoneNumberTextField.tap()
        collectionViewsQuery.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).tap()
        enterPhoneNumberTextField.tap()
        enterPhoneNumberTextField.tap()
        makeOrderAlert.buttons["OK"].tap()
        
        let backButton = app.buttons["Back"]
        backButton.tap()
        
        app.buttons["Make an order"].tap()
        backButton.tap()
        app.buttons["Our branches"].tap()
        app.buttons["Back"].tap()
       
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
