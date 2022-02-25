//
//  MainScreenViewController.swift
//  PayconiqTestAssignment
//
//  Created by Vinay Devdikar on 25/02/22.
//

import UIKit
class MainScreenViewControllerImpl: UIViewController, MainScreenViewController {
    var router: MainScreenRouterImpl!
    var interactor: MainScreenInteractorImpl!
    let configurator: MainScreenConfigurator = MainScreenConfiguratorImpl()
    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var showPopupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        interactor.formatText(with: "abcdefghij")
    }
    
    func updateTextField(with formatted: String) {
        print("This is updatedtext \(formatted)")
    }
}


