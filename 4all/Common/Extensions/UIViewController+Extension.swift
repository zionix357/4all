//
//  UIViewController+Extension.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UIViewController {
    func setBackArrowButton(){
        let backBtn = #imageLiteral(resourceName: "arrow-left").withRenderingMode(.alwaysTemplate)
        navigationController?.navigationBar.backIndicatorImage = backBtn
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBtn
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
