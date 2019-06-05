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

    func testExample() {
        
        let app = XCUIApplication()
        let login = "test"
        let password = "123"
        app/*@START_MENU_TOKEN@*/.buttons["Sign up"]/*[[".segmentedControls.buttons[\"Sign up\"]",".buttons[\"Sign up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let loginField = app.textFields["Login"]
        loginField.tap()
        loginField.typeText(login)
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(password)
        
        let repeatPasswordSecureTextField = app.secureTextFields["Repeat password"]
        repeatPasswordSecureTextField.tap()
        repeatPasswordSecureTextField.typeText(password)

       // let rulesSwitch 
        
        app.buttons["Enter"].tap()
        app.statusBars.children(matching: .other).element.children(matching: .other).element(boundBy: 0).tap()
        XCUIDevice.shared.orientation = .portrait
        XCUIDevice.shared.orientation = .portrait
        app.buttons["Your orders"].tap()
        app.buttons["Order"].tap()
        app.alerts["Make order"].buttons["OK"].tap()
        
        let backButton = app.buttons["Back"]
        backButton.tap()
        app.buttons["Our branches"].tap()
        app.alerts["Allow “GreenhouseApp” to also access your location even when you are not using the app?"].buttons["Always Allow"]/*@START_MENU_TOKEN@*/.tap()/*[[".tap()",".press(forDuration: 1.1);"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
                app.staticTexts["Label"].tap()
        backButton.tap()
        app.buttons["Make an order"].tap()
        
        let compositionPriceCountTable = app.tables["Composition, Price, Count"]
        compositionPriceCountTable.tap()
        compositionPriceCountTable.tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element.children(matching: .other).element.tap()
        
        let searchCompositionSearchField = app.searchFields["Search composition"]
        searchCompositionSearchField.tap()
        searchCompositionSearchField.tap()
        app.buttons["Cart"].tap()
        backButton.tap()

    }

}
