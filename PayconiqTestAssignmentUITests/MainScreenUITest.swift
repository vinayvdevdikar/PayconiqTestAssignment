//
//  MainScreenUITest.swift
//  PayconiqTestAssignmentUITests
//
//  Created by Vinay Devdikar on 02/03/22.
//

import XCTest
@testable import PayconiqTestAssignment
class MainScreenUITest: XCTestCase {

    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// `test_mainScreen` this test happy flow of main screen.
    func test_mainScreen() {
        let app = XCUIApplication()
        XCTAssertTrue(app.staticTexts["Please Enter Code:"].exists)
        XCTAssertTrue(app.textFields.element.exists)
        XCTAssertTrue(app.buttons["Show Popup"].exists)
    }
}
