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
        showPopupButton.isEnabled = false
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
}

extension MainScreenViewControllerImpl: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        interactor.formatText(with: textField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        showPopupButton.isEnabled = textField.text?.count ?? 0 > 3 ? true : false
        return true
    }
}


