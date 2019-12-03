//
//  MapViewController.swift
//  TheWeatherApp
//
//  Created by Tatenda Kabike on 2019/12/03.
//  Copyright © 2019 Tatenda Kabike. All rights reserved.
//

import UIKit
import GoogleMaps

class VacationDestination: NSObject {
    
    let name: String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    init(name: String, location: CLLocationCoordinate2D, zoom: Float) {
        self.name = name
        self.location = location
        self.zoom = zoom
    }
    
}

class MapViewController: UIViewController {
    
    var lat  = 0.0
    var lon = 0.0
    
    
    var mapView: GMSMapView?
    
    var lastVisitDestination: VacationDestination?
    
    let favPlaces = [VacationDestination]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 12)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(lat, lon)
        let marker = GMSMarker(position: currentLocation)
        marker.map = mapView
        
       
    }
    
    func next() {
    
        setMapCamera()
    }
    
    private func setMapCamera() {
        CATransaction.begin()
        CATransaction.setValue(2, forKey: kCATransactionAnimationDuration)
        mapView?.animate(to: GMSCameraPosition.camera(withTarget: lastVisitDestination!.location, zoom: lastVisitDestination!.zoom))
        CATransaction.commit()
        
        let marker = GMSMarker(position: lastVisitDestination!.location)
        marker.title = lastVisitDestination?.name
        marker.map = mapView
    }

}
