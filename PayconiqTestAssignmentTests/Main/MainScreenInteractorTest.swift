/*
See LICENSE folder for this sample’s licensing information.

Abstract:
 
Created by Vinay Devdikar on 25/02/22.
*/

import XCTest
@testable import PayconiqTestAssignment

class MainScreenInteractorTest: XCTestCase {
    private var mainScreenViewController: MainScreenViewControllerImpl!
    private var interactor: MainScreenInteractor!
    private var presenter: MainScreenPresenter!
    private let dummyTextField = UITextField(frame: .zero)


    override func setUpWithError() throws {
        mainScreenViewController = MainScreenViewControllerImpl()
        presenter = MainScreenPresenterImpl(viewController: mainScreenViewController)
        interactor = MainScreenInteractorImpl(presenter: presenter)
        mainScreenViewController.interactor = interactor
        mainScreenViewController.codeTextField = dummyTextField
    }
    
    func test_formatText() {
        interactor.formatText(with: "aaabccde")
        XCTAssertEqual(mainScreenViewController.codeTextField.text, "aaa-bcc-de")
    }
    
    func test_retrieveLastSaveKey() {
        interactor.retrieveLastSaveKey()
        do {
            let status = try XCTUnwrap(mainScreenViewController.codeTextField.text?.isEmpty)
            XCTAssertFalse(status)
        } catch {
            XCTFail("content found nil")
        }
    }
}
