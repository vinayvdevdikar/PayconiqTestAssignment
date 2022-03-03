//
//  PopupScreenRouterTest.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 02/03/22.
//

import XCTest
@testable import PayconiqTestAssignment

class PopupScreenRouterTest: XCTestCase {
    private var mockRouter: MockPopupScreenRouter!
    private var popupScreenViewController: PopupScreenViewControllerImpl!

    override func setUpWithError() throws {
        mockRouter = MockPopupScreenRouter()
        popupScreenViewController = PopupScreenViewControllerImpl()
        popupScreenViewController.router = mockRouter
    }

    override func tearDownWithError() throws {
        mockRouter = nil
        popupScreenViewController = nil
    }
    
    func test_navigateToMainScreen() {
        popupScreenViewController.router.navigateToMainScreen(viewController: popupScreenViewController)
        XCTAssertTrue(mockRouter.isMethodCalled)
        mockRouter.restFlag()
    }
}

class MockPopupScreenRouter: PopupScreenRouterImpl {
    var isMethodCalled: Bool = false
    
    override func navigateToMainScreen(viewController: UIViewController) {
        super.navigateToMainScreen(viewController: viewController)
        isMethodCalled = true
    }
    
    func restFlag() {
        isMethodCalled = false
    }
}
