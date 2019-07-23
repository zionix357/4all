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
    
    var list: [String] = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.displayLoadingIndicator(text: "Fetching...", backgroundColor: .white)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.view.dismissLoadingIndicator()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
