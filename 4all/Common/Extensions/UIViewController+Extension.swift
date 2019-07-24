//
//  UIViewController+Extension.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UIViewController {
    func setBackArrowButton() {
        let backBtn = #imageLiteral(resourceName: "arrow-left").withRenderingMode(.alwaysTemplate)
        navigationController?.navigationBar.backIndicatorImage = backBtn
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBtn
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func showAlert(title: String, text: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
