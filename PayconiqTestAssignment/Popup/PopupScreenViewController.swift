//
//  PopupScreenViewController.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 27/02/22.
//

import UIKit

class PopupScreenViewControllerImpl: UIViewController, PopupScreenViewController {
    var router: PopupScreenRouter!
    var interactor: PopupScreenInteractor!
    let configurator: PopupScreenConfigurator = PopupScreenConfiguratorImpl()
    override func viewDidLoad(){
        super.viewDidLoad()
        configurator.configure(viewController: self)
    }
  
    func updateConstraint(with margin: CGFloat) {
        
    }
}

extension PopupScreenViewControllerImpl {
    
    private func addPopupView() {}
    
}
