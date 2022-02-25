//
//  MainScreenConfigurator.swift
//  PayconiqTestAssignment
//
//  Created by Vinay Devdikar on 25/02/22.
//

import UIKit
struct MainScreenConfiguratorImpl: MainScreenConfigurator {
    
    func configure(viewController: MainScreenViewControllerImpl) {
        let router = MainScreenRouterImpl()
        let presenter = MainScreenPresenterImpl(viewController: viewController)
        let interactor = MainScreenInteractorImpl(presenter: presenter)
        viewController.interactor = interactor
        viewController.router = router
    }
}
