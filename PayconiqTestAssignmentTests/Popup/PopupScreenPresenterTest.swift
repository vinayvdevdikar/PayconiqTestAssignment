//
//  PopupScreenPresenterTest.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 02/03/22.
//

import XCTest
@testable import PayconiqTestAssignment

class PopupScreenPresenterTest: XCTestCase {
    private var popupViewController: MockPopupScreenViewController!
    private var presenter: MockPopupScreenPresenter!
    private var interactor: PopupScreenInteractor!
    
    override func setUpWithError() throws {
        popupViewController = MockPopupScreenViewController()
        presenter = MockPopupScreenPresenter()
        interactor = PopupScreenInteractorImpl(presenter: presenter)
    }

    override func tearDownWithError() throws {
        popupViewController = nil
        presenter = nil
        interactor = nil
    }

    func test_presentView() {
        interactor.calculateMarginPercentage(with: 320.0, percentage: 20, type: .width)
        XCTAssertTrue(presenter.isMethodCalled)
        presenter.resetflag()
    }
    
    func test_presentReshuffelCode() {
        interactor.shuffelTheExistingCharater(with: "asdsa")
        XCTAssertTrue(presenter.isMethodCalled)
        presenter.resetflag()
    }
    
    func test_presentSavedStatus() {
        interactor.storeValueInsideKeychain(with: "asds")
        XCTAssertTrue(presenter.isMethodCalled)
        presenter.resetflag()
    }
}

class MockPopupScreenPresenter: PopupScreenPresenter {
    
    var isMethodCalled = false
    
    func presentView(with margin: CGFloat, and type: PercentageType) {
        isMethodCalled = true
    }
    
    func presentReshuffelCode(with reShuffelCode: String) {
        isMethodCalled = true
    }
    
    func presentSavedStatus(with status: Bool) {
        isMethodCalled = true
    }
    
    func resetflag() {
        isMethodCalled = false
    }
    
}
