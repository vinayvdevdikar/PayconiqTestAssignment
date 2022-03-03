//
//  PopupScreenViewControllerTest.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 02/03/22.
//

import XCTest
@testable import PayconiqTestAssignment

class PopupScreenViewControllerTest: XCTestCase {
    private var popupViewController: PopupScreenViewControllerImpl!
    private var poupViewControllerInterface: MockPopupScreenViewController!
    private var interactor: PopupScreenInteractor!
    private var router: MockPopupScreenRouter!

    override func setUpWithError() throws {
        popupViewController = PopupScreenViewControllerImpl()
        poupViewControllerInterface = MockPopupScreenViewController()
        interactor = PopupScreenInteractorImpl(presenter: MockPopupScreenPresenter())
        router = MockPopupScreenRouter()
        popupViewController.viewDidLoad()
        popupViewController.interactor = interactor
        popupViewController.router = router

    }

    override func tearDownWithError() throws {
        popupViewController = nil
        interactor = nil
        router = nil
    }
    
    func test_view() {
        XCTAssertNotNil(popupViewController.view)
    }

}
