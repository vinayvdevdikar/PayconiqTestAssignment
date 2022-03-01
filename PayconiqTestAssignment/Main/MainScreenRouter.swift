/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Created by Vinay Devdikar on 25/02/22.
*/

import UIKit
class MainScreenRouterImpl: MainScreenRouter {

    func navigateToPopupScreen(viewController: UIViewController){
       // let popupVC = PopupScreenViewControllerImpl()
       // viewController.navigationController?.pushViewController(popupVC, animated: true)
        viewController.performSegue(withIdentifier: "navigateToPopupView", sender: nil)
    }
}
