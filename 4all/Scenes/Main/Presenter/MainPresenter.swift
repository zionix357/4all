//
//  MainPresenter.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class MainPresenter {
    private(set) weak var view: MainPresenterView?
    private(set) var router: MainPresenterRouter
    var taskRepository: TaskRepositoryProtocol?
    var assignment: Assignment? {
        didSet {
            guard let ass = assignment else { return }
            view?.displayView(photoURL: ass.photoURL)
            view?.displayView(logoURL: ass.logoURL)
            view?.displayView(title: ass.title)
            view?.displayView(text: ass.text)
            view?.displayView(address: ass.address)
            view?.displayView(latitude: ass.latitude, longitude: ass.longitude, regionRadius: 500)
            view?.displaview(city: ass.city, neighborhood: ass.neighborhood)
        }
    }
    var comments: [Comment] = []
    var id: String?
    
    init(view: MainPresenterView, router: MainPresenterRouter) {
        self.view = view
        self.router = router
    }
    
    func present() {
        fetchId()
    }
    
    private func fetchId() {
        guard let id = id else { fatalError("Injection ID") }
        view?.startLoading(text: "Fetching...", backgroundColor: .white)
        taskRepository?.fetchId(id: id, response: { [weak self] (response, err) in
            self?.view?.stopLoading()
            self?.view?.hideMessage()
            guard let assignment = response else {
                self?.view?.showMessage(icon: .notFound,
                                        text: err,
                                        sizeIcon: 100,
                                        backgroundColor: .white,
                                        isButton: true,
                                        titleButton: "RELOAD")
                return
            }
            self?.assignment = assignment
            self?.comments = assignment.comments
            self?.view?.reloadData()
        })
    }
    
    func configure(for row: Int, _ cell: CommentCellPresenterView) {
        cell.displayView(photoURL: comments[row].photoURL)
        cell.displayView(name: comments[row].name)
        cell.displayView(title: comments[row].title)
        cell.displayView(comment: comments[row].comment)
        cell.displayView(note: Double(comments[row].note))
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
    
    func onPhoneButtonPressed() {
        guard let ass = assignment else { fatalError("Injection ID") }
        ass.phone.makeACall()
    }
    
    func onAddressButtonPressed() {
        guard let ass = assignment else { fatalError("Injection ID") }
        view?.showAlert(title: "Address", message: ass.getAddress())
    }
    
    func onCommentButtonPressed() {
        view?.scrollToComments()
    }
    
    func onServiceButtonPressed() {
        router.onShowServices()
    }
}
