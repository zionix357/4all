//
//  HomePresenter.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class HomePresenter {
    private(set) weak var view: HomePresenterView?
    private(set) var router: HomePresenterRouter
    var taskRepository: TaskRepositoryProtocol?
    var ids: [String] = []
    
    init(view: HomePresenterView, router: HomePresenterRouter) {
        self.view = view
        self.router = router
    }
    
    func present() { fetchAll() }
    
    private func fetchAll() {
        view?.startLoading(text: "Fetching...", backgroundColor: .white)
        taskRepository?.fetchAll(response: { [weak self] (response, err) in
            self?.view?.stopLoading()
            self?.view?.hideMessage()
            guard let ids = response else {
                self?.view?.showMessage(icon: .notFound,
                                        text: err,
                                        sizeIcon: 100,
                                        backgroundColor: .white,
                                        isButton: true,
                                        titleButton: "RELOAD")
                return
            }
            self?.ids = ids
            self?.view?.reloadData()
        })
    }
    
    func configure(for row: Int, _ cell: UITableViewCell) {
        cell.textLabel?.text = ids[row]
    }
    
    func onDidSelect(for row: Int) {
        router.onShowMain(id: ids[row])
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
