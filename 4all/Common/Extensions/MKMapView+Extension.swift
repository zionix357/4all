//
//  MKMapView+Extension.swift
//  4all
//
//  Created by Arthur Rocha on 24/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit
import MapKit

extension MKMapView {
    func setPinIn(latitude: CLLocationDegrees, longitude: CLLocationDegrees, regionRadius: CLLocationDistance) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.addAnnotation(annotation)
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        let regionRadius: CLLocationDistance = regionRadius
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        self.setRegion(coordinateRegion, animated: true)
    }
}
