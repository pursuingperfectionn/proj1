//
//  ViewController.swift
//  Shehzar
//
//  Created by admin on 3/26/19.
//  Copyright © 2019 admin. All rights reserved.
//

/*
 IMPORTANT NOTE:
 I personally do not have a mac machine, so I am not able to complete it,
 BUT I have demonstrated the reusable and flexable way I used to work.
*/

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var currentLocation:CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let status = LocationOperations.sharedInstance.locationPermission()
        guard status == LocationOperations.permissionStatus.authorizedWhenInUse else {
            return
        }
        
        LocationOperations.sharedInstance.locationManager.delegate = self
        LocationOperations.sharedInstance.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        LocationOperations.sharedInstance.locationManager.startUpdatingLocation()
        
        NearByPlaces.sharedInstance.fetchPlaces(lat: currentLocation?.latitude, long: currentLocation?.longitude, key: constants.googleAPIKey, radius: 5000, pageToken: "20", category: constants.category)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        currentLocation = locValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension ViewController {
    //TableView Implmentation
}
