//
//  MainPresenterRouter.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class MainPresenterRouter {
    struct Constants { // swiftlint:disable nesting
        struct Segue {
            static let ShowServices = "servicesSegue"
        }
    }
    
    private weak var viewController: MainController?
    
    init(viewController: MainController) {
        self.viewController = viewController
    }
    
    func onShowServices() {
        viewController?.performSegue(withIdentifier: Constants.Segue.ShowServices, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
