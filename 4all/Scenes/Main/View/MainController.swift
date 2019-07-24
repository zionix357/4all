//
//  MainController.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    @IBOutlet weak var commentsTableView: UITableView! {
        didSet {
            commentsTableView.register(UINib(nibName: "CommentCell", bundle: .main), forCellReuseIdentifier: CommentCell.identifier)
            commentsTableView.rowHeight = UITableView.automaticDimension
            commentsTableView.estimatedRowHeight = 70
            commentsTableView.tableFooterView = UIView(frame: CGRect.zero)
        }
    }
    @IBOutlet weak var commentsTableViewHeightLayoutConstraint: NSLayoutConstraint!
    
    let comments: [String] = [
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
        "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
        "On the other hand, we denounce with righteous"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testTitleView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "search"), style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        recalculateSizeCommentsTableView()
    }
    
    func testTitleView() {
        let customTitleView = TitleView.instantiateFromNib()
        customTitleView.setTitle("Porto Alegre - Moinhos de Vento")
        self.navigationItem.titleView = customTitleView
    }
    
    private func recalculateSizeCommentsTableView() {
        commentsTableView.layoutIfNeeded()
        commentsTableViewHeightLayoutConstraint.constant = commentsTableView.contentSize.height
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}

extension MainController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as! CommentCell
        cell.commentLabel.text = comments[indexPath.row]
        return cell
    }
}
