/*
See LICENSE folder for this sample’s licensing information.

Abstract: This ViewController test class
 
Created by Vinay Devdikar on 25/02/22.
*/

import XCTest
@testable import PayconiqTestAssignment

class MainScreenViewControllerTest: XCTestCase {
    private var mainScreenViewController: MainScreenViewControllerImpl!
    private var router: MockRouter!
    private var interactor: MockInteractor!
    private let dummyTextField = UITextField(frame: .zero)
    private let dummyButton = UIButton(frame: .zero)

    override func setUpWithError() throws {
        router = MockRouter()
        interactor = MockInteractor()
        mainScreenViewController = MainScreenViewControllerImpl()
        mainScreenViewController.router = router
        mainScreenViewController.interactor = interactor
        mainScreenViewController.codeTextField = dummyTextField
        mainScreenViewController.showPopupButton = dummyButton
    }

    func test_showPopupScreen() {
        mainScreenViewController.showPopupScreen()
        XCTAssertTrue(router.isMethodCalled)
        router.resetflag()
    }
    
    func test_updateTextField() {
        mainScreenViewController.updateTextField(with: "abc-efg")
        XCTAssertEqual(mainScreenViewController.codeTextField.text, "abc-efg")
    }
    
    func test_supportedInterfaceOrientations() {
        XCTAssertEqual(mainScreenViewController.supportedInterfaceOrientations, .all)
    }
    
    func test_textFieldDidEndEditing() {
        mainScreenViewController.textFieldDidEndEditing(dummyTextField)
        XCTAssertTrue(interactor.isMethodCalled)
        interactor.resetflag()
    }
    
    func test_textFieldShouldReturn() {
        XCTAssertTrue(mainScreenViewController.textFieldShouldReturn(dummyTextField))
        XCTAssertFalse(dummyTextField.isFirstResponder)
    }

}

class MockRouter: MainScreenRouter {
    var isMethodCalled = false
    
    func navigateToPopupScreen(viewController: UIViewController) {
        isMethodCalled = true
    }
    
    func resetflag() {
        isMethodCalled = false
    }
}

class MockInteractor: MainScreenInteractor {
    var isMethodCalled = false
    
    func formatText(with unformatted: String) {
        isMethodCalled = true
    }
    
    func retrieveLastSaveKey() {
        isMethodCalled = true
    }
    
    func resetflag() {
        isMethodCalled = false
    }
}
