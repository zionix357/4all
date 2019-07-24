//
//  MainController.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher

class MainController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageViewX!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var commentsTableView: UITableView! {
        didSet {
            commentsTableView.register(UINib(nibName: "CommentCell", bundle: .main), forCellReuseIdentifier: CommentCell.identifier)
            commentsTableView.rowHeight = UITableView.automaticDimension
            commentsTableView.estimatedRowHeight = 70
            commentsTableView.tableFooterView = UIView(frame: CGRect.zero)
        }
    }
    @IBOutlet weak var commentsTableViewHeightLayoutConstraint: NSLayoutConstraint!
    
    var presenter: MainPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackArrowButton()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "search"), style: .plain, target: nil, action: nil)
        
        presenter?.present()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        recalculateSizeCommentsTableView()
    }
    
    private func recalculateSizeCommentsTableView() {
        commentsTableView.layoutIfNeeded()
        commentsTableViewHeightLayoutConstraint.constant = commentsTableView.contentSize.height
    }
    
    @IBAction func onPhoneButton(_ sender: Any) {
        presenter?.onPhoneButtonPressed()
    }
    
    @IBAction func onServiceButton(_ sender: Any) {
        
    }
    
    @IBAction func onAddressButton(_ sender: Any) {
        presenter?.onAddressButtonPressed()
    }
    
    @IBAction func onCommentButton(_ sender: Any) {
        presenter?.onCommentButtonPressed()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}

extension MainController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.comments.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as! CommentCell
        presenter?.configure(for: indexPath.row, cell)
        return cell
    }
}

extension MainController: MainPresenterView {
    func showAlert(title: String) {
        let alertController = UIAlertController(title: "Address", message: title, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(actionOK)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func scrollToComments() {
        scrollView.scrollToView(view: commentsTableView, animated: true)
    }
    
    func displaview(city: String, neighborhood: String) {
        let customTitleView = TitleView.instantiateFromNib()
        customTitleView.setTitle("\(city) - \(neighborhood)")
        self.navigationItem.titleView = customTitleView
    }
    
    func displayView(title: String) {
        titleLabel.text = title
    }
    
    func displayView(text: String) {
        textLabel.text = text
    }
    
    func displayView(logoURL: String) {
        guard let url = URL(string: logoURL) else { return }
        logoImageView.kf.setImage(with: url)
    }
    
    func displayView(photoURL: String) {
        guard let url = URL(string: photoURL) else { return }
        photoImageView.kf.setImage(with: url)
    }
    
    func displayView(address: String) {
        addressLabel.text = address
    }
    
    func displayView(latitude: Double, longitude: Double) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.addAnnotation(annotation)
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        let regionRadius: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func startLoading(text: String, backgroundColor: UIColor) {
        view.displayLoadingIndicator(text: text, backgroundColor: backgroundColor)
    }
    
    func stopLoading() {
        view.dismissLoadingIndicator()
    }
    
    func reloadData() {
        commentsTableView.reloadData()
        recalculateSizeCommentsTableView()
    }
    
    func showMessage(icon: Icon, text: String, sizeIcon: Int, backgroundColor: UIColor, isButton: Bool, titleButton: String) {
        view.displayMessageView(icon: icon, text: text, sizeIcon: sizeIcon, backgroundColor: backgroundColor, isButton: isButton, titleButton: titleButton) { [weak self] in
            self?.presenter?.present()
        }
    }
    
    func hideMessage() {
        view.dismissMessageView()
    }
}
