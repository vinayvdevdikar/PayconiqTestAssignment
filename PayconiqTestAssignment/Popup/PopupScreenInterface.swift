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
    func calculateMarginPercentage(with heightOrWidth: CGFloat, percentage: CGFloat, type: PercentageType)
}

protocol PopupScreenPresenter {
    func presentView(with margin: CGFloat, and type: PercentageType)
}

protocol PopupScreenViewController {
    func changeLeftRightConstraintConstant(with margin: CGFloat)
    func changeTopBottomConstraintConstant(with margin: CGFloat)
}

enum PercentageType {
    case height
    case width
}
