//
//  UIImageViewX.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

@IBDesignable
class UIImageViewX: UIImageView {
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override func draw(_ rect: CGRect) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }
}
