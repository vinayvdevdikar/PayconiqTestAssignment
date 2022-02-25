//
//  MainScreenInteractor.swift
//  PayconiqTestAssignment
//
//  Created by Vinay Devdikar on 25/02/22.
//

import Foundation
class MainScreenInteractorImpl: MainScreenInteractor {
    let presenter: MainScreenPresenter
    
    init(presenter: MainScreenPresenter) {
        self.presenter = presenter
    }
    
    func formatText(with unformatted: String) {
        print("This is unformatted text \(unformatted)")
        presenter.showContentOnScreen(with: "abc-efg-hij")
    }
}
