//
//  SwinjectStoryboard+Extension.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Moya
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        Container.loggingFunction = nil
        defaultContainer.register(MoyaProvider<TaskService>.self) { _ in MoyaProvider<TaskService>() }
        defaultContainer.register(TaskRepositoryProtocol.self) { resolve in
            TaskRepository(provider: resolve.resolve(MoyaProvider<TaskService>.self)!)
        }
        defaultContainer.storyboardInitCompleted(HomeController.self) { resolver, controller in
            let presenter = HomePresenter(
                view: controller.self,
                router: HomePresenterRouter(viewController: controller.self))
            presenter.taskRepository = resolver.resolve(TaskRepositoryProtocol.self)
            controller.presenter = presenter
        }
    }
}
