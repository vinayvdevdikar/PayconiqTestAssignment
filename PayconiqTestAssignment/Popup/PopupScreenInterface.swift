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
    func shuffelTheExistingCharater(with code: String)
}

protocol PopupScreenPresenter {
    func presentView(with margin: CGFloat, and type: PercentageType)
    func presentReshuffelCode(with reShuffelCode: String)
}

protocol PopupScreenViewController {
    func changeLeftRightConstraintConstant(with margin: CGFloat)
    func changeTopBottomConstraintConstant(with margin: CGFloat)
    func changeTheTextOfLabel(with reShuffelCode: String)
}

enum PercentageType {
    case height
    case width
}
