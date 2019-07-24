//
//  CommentCell.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit
import Cosmos

class CommentCell: UITableViewCell {
    class var identifier:String {return String(describing: type(of: CommentCell.self))}
    
    
    @IBOutlet weak var photoImageView: UIImageViewX!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var noteCosmosView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CommentCell: CommentCellPresenterView {
    func displayView(name: String) {
        nameLabel.text = name
    }
    
    func displayView(title: String) {
        titleLabel.text = title
    }
    
    func displayView(comment: String) {
        commentLabel.text = comment
    }
    
    func displayView(note: Double) {
        noteCosmosView.rating = note
    }
    
    func displayView(photoURL: String) {
        guard let url = URL(string: photoURL) else { return }
        photoImageView.kf.setImage(with: url)
    }
}
