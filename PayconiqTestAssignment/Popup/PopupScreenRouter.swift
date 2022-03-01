//
//  PopupScreenRouter.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 27/02/22.
//

import UIKit
class PopupScreenRouterImpl: PopupScreenRouter {
    func navigateToMainScreen(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
