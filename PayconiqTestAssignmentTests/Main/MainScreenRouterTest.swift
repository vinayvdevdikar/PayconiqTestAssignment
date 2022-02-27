/*
See LICENSE folder for this sample’s licensing information.

Abstract: This is router class tests.
Created by Vinay Devdikar on 25/02/22.
*/

import XCTest
@testable import PayconiqTestAssignment

class MainScreenRouterTest: XCTestCase {
    private var mainScreenViewController: MainScreenViewControllerImpl!
    private var router: MockRouter!

    override func setUpWithError() throws {
        router = MockRouter()
        mainScreenViewController = MainScreenViewControllerImpl()
        mainScreenViewController.router = router
    }
    
    func test_navigateToPopupScreen() {
        mainScreenViewController.showPopupScreen()
        XCTAssertTrue(router.isMethodCalled)
        router.resetflag()
    }

}
