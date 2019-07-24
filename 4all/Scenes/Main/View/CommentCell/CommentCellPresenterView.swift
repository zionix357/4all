//
//  CommentCellPresenterView.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

protocol CommentCellPresenterView: AnyObject {
    func displayView(name: String)
    func displayView(title: String)
    func displayView(comment: String)
    func displayView(note: Double)
    func displayView(photoURL: String)
}
