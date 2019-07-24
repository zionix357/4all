//
//  MainPresenterRouter.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class MainPresenterRouter {
    private weak var viewController: MainController?
    
    init(viewController: MainController) {
        self.viewController = viewController
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
