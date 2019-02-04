//
//  UIStudioExtension.swift
//  Plainsboro Birdwatch
//
//  Created by Avyay Natarajan on 12/10/18.
//  Copyright © 2018 Avyay's Apps. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
}

@IBDesignable extension MenuButton {
    
    @IBInspectable var navigateTo: UIView {
        set {
            actionPageView = navigateTo;
        }
        get {
            return actionPageView;
        }
    }
    
}
