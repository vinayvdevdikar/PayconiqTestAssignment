//
//  PopupScreenPresenter.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 27/02/22.
//

import UIKit
class PopupScreenPresenterImpl: PopupScreenPresenter {
    let viewController: PopupScreenViewController
    
    init(viewController: PopupScreenViewController) {
        self.viewController = viewController
    }
    
    func presentView(with margin: CGFloat, and type: PercentageType) {
        switch type {
        case .height:
            viewController.changeTopBottomConstraintConstant(with: margin)
        case .width:
            viewController.changeLeftRightConstraintConstant(with: margin)
        }
    }
    
    func presentReshuffelCode(with reShuffelCode: String) {
        viewController.changeTheTextOfLabel(with: reShuffelCode)
    }
    
    func presentSavedStatus(with status: Bool) {
        viewController.showSaveStatusOnScreen(with: status)
    }
}
