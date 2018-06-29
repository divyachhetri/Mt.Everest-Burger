//
//  MapController.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/27/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController {
    
    let mapView : MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    var lattitude : Double = 0.0
    var longitude : Double = 0.0
    var navTitle = ""
    var anoTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = navTitle.uppercased()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.backBarButtonItem?.tintColor = .white
        setMapView()
    }
    func setMapView() {
        view.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(lattitude, longitude)
        let span : MKCoordinateSpan = MKCoordinateSpanMake(0.001, 0.001)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = anoTitle
        mapView.addAnnotation(annotation)

    }

}
