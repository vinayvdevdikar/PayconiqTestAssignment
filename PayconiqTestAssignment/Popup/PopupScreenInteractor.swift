//
//  PopupScreenInteractor.swift
//  PayconiqTestAssignmentTests
//
//  Created by Vinay Devdikar on 27/02/22.
//

import UIKit
import Security

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
    
    ///`shuffelTheExistingCharater` shuffel the charater
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
    
    ///`storeValueInsideKeychain` store value in keychain and if already available then update it.
    func storeValueInsideKeychain(with code: String) {
        guard let data = code.data(using: .utf8) else {
            return
        }
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: Keychain.service,
            kSecAttrAccount: Keychain.account,
        ] as CFDictionary
        
        // Add data in query to keychain
        var status = SecItemAdd(query, nil)
        
        // Item already exist, thus update it.
        if status == errSecDuplicateItem {
            let attributesToUpdate = [kSecValueData: data] as CFDictionary
            status = SecItemUpdate(query, attributesToUpdate)
        }
        
        presenter.presentSavedStatus(with: status == errSecSuccess)
    }
}
