//
//  NavigationItem+Extension.swift
//  4all
//
//  Created by Arthur Rocha on 24/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UINavigationItem {
    func setTitleViewCustom(text: String) {
        let customTitleView = TitleView.instantiateFromNib()
        customTitleView.setTitle(text)
        titleView = customTitleView
    }
}
