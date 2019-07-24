//
//  TitleView.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class TitleView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!

    class func instantiateFromNib() -> TitleView {
        let nib = UINib(nibName: "TitleView", bundle: nil)
        let nibObjects = nib.instantiate(withOwner: nil, options: nil)
        let customTitleView = nibObjects.first as! TitleView
        return customTitleView
    }
    
    func setTitle(_ title: String) {
        titleLabel?.text = title
    }
}
