//
//  PopupScreenInteractor.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 27/02/22.
//

import UIKit
class PopupScreenInteractorImpl: PopupScreenInteractor {
    let presenter: PopupScreenPresenter
    
    init(presenter: PopupScreenPresenter) {
        self.presenter = presenter
    }

    func calculateMarginPercentage(with heightOrWidth: CGFloat,
                                   percentage: CGFloat,
                                   type: PercentageType) {
        //converting percentage into decimal
        let prcentageIndecimal = percentage / 100.0
        let margin = prcentageIndecimal * heightOrWidth
        presenter.presentView(with: margin, and: type)
    }
}
