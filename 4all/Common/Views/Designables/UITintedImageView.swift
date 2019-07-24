//
//  UITintedImageView.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

@IBDesignable class UITintedImageView: UIImageView {
    override func prepareForInterfaceBuilder() {
        self.configure()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configure()
    }
    
    @IBInspectable override var tintColor: UIColor! {
        didSet {
            self.configure()
        }
    }
    
    private func configure() {
        self.image = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
    }
}
