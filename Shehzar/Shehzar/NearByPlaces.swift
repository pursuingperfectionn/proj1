//
//  NearByPlaces.swift
//  Shehzar
//
//  Created by admin on 3/26/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreLocation

class NearByPlaces: NSObject {
    
    var data:[String:Any]?

    static let sharedInstance = NearByPlaces()
    private override init() {
        
    }
    
    func fetchPlaces(lat:CLLocationCoordinate2D, long:CLLocationCoordinate2D, key:String, radius:Double, pageToken:String, category:String) {
        
        var params : [String : Any]

        params = [
            "key" : constants.googleAPIKeyAlamofire.request(constants.searchApiHost, parameters: params, encoding: URLEncoding(destination: .queryString)).responseJSON { response in
                
                let response = QNearbyPlacesResponse.init(dic: response.result.value as? [String: Any])
                completion(response)
            },
            "radius" : radius,
            "location" : "\(lat),\(long)",
            "type" : category,
            "pagetoken" : pageToken,
            "key": key
        ]
        
        Alamofire.request(searchApiHost, parameters: params, encoding: URLEncoding(destination: .queryString)).responseJSON { response in
            data = response.result.value as? [String: Any]
        }
    }
}
