/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Created by Vinay Devdikar on 25/02/22.
*/

import Foundation
class MainScreenPresenterImpl: MainScreenPresenter {
    let viewController: MainScreenViewController
    
    init(viewController: MainScreenViewController) {
        self.viewController = viewController
    }
    
    func showContentOnScreen(with formatted: String) {
        viewController.updateTextField(with: formatted)
    }
}
