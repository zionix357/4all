//
//  HomeController.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.tableFooterView = UIView(frame: CGRect.zero)
        }
    }
    
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.present()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter?.prepare(for: segue, sender: sender)
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.ids.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        presenter?.configure(for: indexPath.row, cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onDidSelect(for: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeController: HomePresenterView {
    func showMessage(icon: Icon, text: String, sizeIcon: Int, backgroundColor: UIColor, isButton: Bool, titleButton: String) {
        view.displayMessageView(icon: icon, text: text, sizeIcon: sizeIcon, backgroundColor: backgroundColor, isButton: isButton, titleButton: titleButton) { [weak self] in
            self?.presenter?.present()
        }
    }
    
    func hideMessage() {
        view.dismissMessageView()
    }
    
    func startLoading(text: String, backgroundColor: UIColor) {
        view.displayLoadingIndicator(text: text, backgroundColor: backgroundColor)
    }
    
    func stopLoading() {
        view.dismissLoadingIndicator()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
