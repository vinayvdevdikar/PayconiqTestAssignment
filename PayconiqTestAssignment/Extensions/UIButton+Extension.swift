//
//  UIButton+Extension.swift
//  PayconiqTestAssignment
//
//  Created by Vinay Devdikar on 02/03/22.
//

import UIKit
extension UIButton {
    
    func setBorder() {
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}
