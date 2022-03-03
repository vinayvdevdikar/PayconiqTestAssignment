//
//  PopupScreenInteractorTest.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 02/03/22.
//

import XCTest
@testable import PayconiqTestAssignment

class PopupScreenInteractorTest: XCTestCase {
    private var popupViewController: MockPopupScreenViewController!
    private var interactor: PopupScreenInteractor!
    private var presenter: PopupScreenPresenter!

    override func setUpWithError() throws {
        popupViewController = MockPopupScreenViewController()
        presenter = PopupScreenPresenterImpl(viewController: popupViewController)
        interactor = PopupScreenInteractorImpl(presenter: presenter)
    }

    override func tearDownWithError() throws {
        popupViewController = nil
        interactor = nil
        presenter = nil
    }

    func test_calculateMarginPercentage() {
        interactor.calculateMarginPercentage(with: 320.0, percentage: 20, type: .width)
        XCTAssertEqual(popupViewController.updatedMargin, 64.0)
        popupViewController.resetFlags()
        
        interactor.calculateMarginPercentage(with: 480.0, percentage: 10, type: .height)
        XCTAssertEqual(popupViewController.updatedMargin, 48.0)
        popupViewController.resetFlags()
    }
    
    func test_shuffelTheExistingCharater() {
        interactor.shuffelTheExistingCharater(with: "dum-tex-ted")
        XCTAssertNotEqual(popupViewController.updateShuffelCode, "")
        popupViewController.resetFlags()
    }
    
    func test_storedValuesInKeychain() {
        interactor.storeValueInsideKeychain(with: "dum-tex-ted")
        XCTAssertTrue(popupViewController.updatedStatus)
        popupViewController.resetFlags()
    }
}

class MockPopupScreenViewController: PopupScreenViewController {
    var updatedMargin: CGFloat = 0
    var updateShuffelCode: String = ""
    var updatedStatus: Bool = false
    
    func changeLeftRightConstraintConstant(with margin: CGFloat) {
        updatedMargin = margin
    }
    
    func changeTopBottomConstraintConstant(with margin: CGFloat) {
        updatedMargin = margin
    }
    
    func changeTheTextOfLabel(with reShuffelCode: String) {
        updateShuffelCode = reShuffelCode
    }
    
    func showSaveStatusOnScreen(with status: Bool) {
        updatedStatus = status
    }
    
    func resetFlags() {
        updatedMargin = 0
        updateShuffelCode = ""
        updatedStatus = false
    }
    
}
