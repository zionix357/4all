//
//  HomePresenterRouter.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class HomePresenterRouter {
    struct Constants { // swiftlint:disable nesting
        struct Segue {
            static let ShowMain = "mainSegue"
        }
    }
    private weak var viewController: HomeController?
    
    init(viewController: HomeController) {
        self.viewController = viewController
    }
    
    func onShowMain(id: String) {
        viewController?.performSegue(withIdentifier: Constants.Segue.ShowMain, sender: id)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.ShowMain,
            let destination = segue.destination as? MainController,
            let id = sender as? String
            {
            destination.presenter?.id = id
        }
    }
}
