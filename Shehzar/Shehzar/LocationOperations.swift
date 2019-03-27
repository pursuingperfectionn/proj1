//
//  LocationOperations.swift
//  Shehzar
//
//  Created by admin on 3/26/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreLocation

class LocationOperations: NSObject {
    
    enum permissionStatus {
        case notDetermined
        case denied
        case restricted
        case authorizedWhenInUse
        case authorizedAlways
    }
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    static let sharedInstance = LocationOperations()
    private override init() {
    }
    
    
    //locationManager(_:didChangeAuthorization:)  Will Get The Status Change ..... and Required Functionality Can Be Implemented In It.
    func locationPermission() -> permissionStatus {
        let status = CLLocationManager.authorizationStatus()
        var statusMessage:permissionStatus
        switch status {
        
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            statusMessage = .notDetermined
            return statusMessage

        case .denied:
            return .denied
            
        case .restricted:
            return .restricted
            
        case .authorizedWhenInUse:
            return .authorizedWhenInUse
            
        case .authorizedAlways:
            return .authorizedAlways
        }
    }
}
