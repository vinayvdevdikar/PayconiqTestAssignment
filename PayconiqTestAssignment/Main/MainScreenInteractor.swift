/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Created by Vinay Devdikar on 25/02/22.
*/

import Foundation
class MainScreenInteractorImpl: MainScreenInteractor {
    let presenter: MainScreenPresenter
    
    init(presenter: MainScreenPresenter) {
        self.presenter = presenter
    }
    
    func formatText(with unformatted: String) {
        let characters = Array(unformatted.replacingOccurrences(of: "-", with: ""))
        var formatedString = ""
        var index = 1
        characters.forEach { character in
            formatedString.append(character)
            if index % 3 == 0 && index < characters.count{
                formatedString.append("-")
            }
            
            index += 1
        }
        presenter.showContentOnScreen(with: formatedString)
    }
    
    /// `retriveLastSaveKey` pull last save key from keychain.
    func retrieveLastSaveKey() {
        let query = [
            kSecAttrService: Keychain.service,
            kSecAttrAccount: Keychain.account,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        if let stringData = result as? Data,
           let savedString = String(data: stringData, encoding: .utf8) {
            presenter.presentSaveString(with: savedString)
        } else {
            presenter.presentSaveString(with: "")
        }
    }
}
