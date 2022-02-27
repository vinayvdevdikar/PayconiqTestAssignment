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
    
    func updateMaragin(with width: CGFloat, percentage: CGFloat) {
        
    }
}
