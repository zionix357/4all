//
//  MainPresenterView.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol MainPresenterView: AnyObject {
    func startLoading(text: String, backgroundColor: UIColor)
    func stopLoading()
    func reloadData()
    func showMessage(
        icon: Icon,
        text: String,
        sizeIcon: Int,
        backgroundColor: UIColor,
        isButton: Bool,
        titleButton: String)
    func hideMessage()
    
    func displayView(title: String)
    func displayView(text: String)
    func displayView(logoURL: String)
    func displayView(photoURL: String)
    func displayView(address: String)
    func displayView(latitude: Double, longitude: Double)
    func displaview(city: String, neighborhood: String)
    
    func scrollToComments()
    func showAlert(title: String)
}
