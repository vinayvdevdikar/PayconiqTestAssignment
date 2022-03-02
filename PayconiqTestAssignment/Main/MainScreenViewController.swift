/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Created by Vinay Devdikar on 25/02/22.
*/

import UIKit
class MainScreenViewControllerImpl: UIViewController, MainScreenViewController {
    var router: MainScreenRouter!
    var interactor: MainScreenInteractor!
    let configurator: MainScreenConfigurator = MainScreenConfiguratorImpl()
    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var showPopupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        applyViewModel()
        interactor.retrieveLastSaveKey()
    }
    
    func updateTextField(with formatted: String) {
        codeTextField.text = formatted
    }
    
    @IBAction func showPopupScreen() {
        router.navigateToPopupScreen(viewController: self)
    }
    
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .all
    }
    
    /// `prepare` this method is used to share app code to next view controller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let popupViewController = segue.destination as? PopupScreenViewControllerImpl {
            popupViewController.selectedCode = codeTextField.text ?? ""
        }
    }
    
    /// `applyViewModel` Set all text
    func applyViewModel() {
        title = NSLocalizedString("mainscreen_title", comment: "")
        showPopupButton.setTitle(NSLocalizedString("mainscreen_showpopup_button", comment: ""), for: .normal)
    }
}

extension MainScreenViewControllerImpl: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        interactor.formatText(with: textField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

