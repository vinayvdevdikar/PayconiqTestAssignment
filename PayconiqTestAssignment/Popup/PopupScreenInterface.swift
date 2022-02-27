//
//  PopupScreenInterface.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 27/02/22.
//

import UIKit
protocol PopupScreenConfigurator {
    func configure(viewController: PopupScreenViewControllerImpl)
}

protocol PopupScreenRouter {
    func navigateToMainScreen(viewController: UIViewController)
}

protocol PopupScreenInteractor {
    func updateMaragin(with width: CGFloat, percentage: CGFloat)
}

protocol PopupScreenPresenter {
    func updatePopupContraint(with margin: CGFloat)
}

protocol PopupScreenViewController {
    func updateConstraint(with margin: CGFloat)
}
