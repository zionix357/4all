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
            static let ShowDetail = ""
        }
    }
    private weak var viewController: HomeController?
    
    init(viewController: HomeController) {
        self.viewController = viewController
    }
    
    func onShowDetails(id: String) {
        viewController?.performSegue(withIdentifier: Constants.Segue.ShowDetail, sender: id)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
