/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Created by Vinay Devdikar on 25/02/22.
*/

import XCTest
@testable import PayconiqTestAssignment

class MainScreenPresenterTest: XCTestCase {
    private var interactor: MainScreenInteractorImpl!
    private var presenter: MockMainScreenPresenter!

    override func setUpWithError() throws {
        presenter = MockMainScreenPresenter()
        interactor = MainScreenInteractorImpl(presenter: presenter)
    }
    
    func test_showContentOnScreen() {
        interactor.formatText(with: "1234567890")
        XCTAssertTrue(presenter.isMethodCalled)
    }
}

class MockMainScreenPresenter: MainScreenPresenter {
    var isMethodCalled = false
    func showContentOnScreen(with formatted: String) {
        isMethodCalled = true
    }
    func resetflag() {
        isMethodCalled = false
    }
    
}
