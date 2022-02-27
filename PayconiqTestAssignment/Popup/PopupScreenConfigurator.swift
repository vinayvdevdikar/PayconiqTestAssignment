//
//  PopupScreenConfigurator.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 27/02/22.
//

import UIKit
struct PopupScreenConfiguratorImpl: PopupScreenConfigurator {
    
    func configure(viewController: PopupScreenViewControllerImpl) {
        let router = PopupScreenRouterImpl()
        let presenter = PopupScreenPresenterImpl(viewController: viewController)
        let interactor = PopupScreenInteractorImpl(presenter: presenter)
        viewController.interactor = interactor
        viewController.router = router
    }
}
