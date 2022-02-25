//
//  MainScreenInterface.swift
//  PayconiqTestAssignment
//
//  Created by Vinay Devdikar on 25/02/22.
//

import UIKit
protocol MainScreenConfigurator {
    func configure(viewController: MainScreenViewControllerImpl)
}

protocol MainScreenRouter {
    func navigateToPopupScreen(viewController: UIViewController)
}

protocol MainScreenInteractor {
    func formatText(with unformatted: String)
}

protocol MainScreenPresenter {
    func showContentOnScreen(with formatted: String)
}

protocol MainScreenViewController {
    func updateTextField(with formatted: String)
}
