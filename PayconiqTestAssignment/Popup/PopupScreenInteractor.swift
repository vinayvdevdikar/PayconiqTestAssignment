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
    
    func shuffelTheExistingCharater(with code: String) {
        let shuffeledString =  String(code.shuffled())
        let characters = Array(shuffeledString)
        var formatedString = ""
        var index = 1
        characters.forEach { character in
            formatedString.append(character)
            if index % 3 == 0 && index < characters.count{
                formatedString.append("-")
            }
            index += 1
        }
        presenter.presentReshuffelCode(with: formatedString)
    }
}
