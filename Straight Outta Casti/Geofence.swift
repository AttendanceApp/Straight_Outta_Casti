
//  Geofence.swift
//  Geolocation Sample
//
//  Created by Vanessa Woo on 2/6/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import CoreLocation

class Geofence: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    public var inCasti: Bool = false
    let deadband: Double
    let targetLatitude: Double
    let targetLongitude: Double
    
    init (deadband: Double, targetLatitude: Double, targetLongitude: Double) {
        self.deadband = deadband
        self.targetLatitude = targetLatitude
        self.targetLongitude = targetLongitude
        super.init()
        self.locationManager.requestAlwaysAuthorization()
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.allowsBackgroundLocationUpdates = true
        }    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        inCasti = region.contains(locations[locations.count-1].coordinate)
//        print (locations[locations.count-1].coordinate)
//        print (inCasti)
//        print (region.center)
//        print ()
        let currentLatitude = locations[locations.count-1].coordinate.latitude
        let currentLongitude = locations[locations.count-1].coordinate.longitude
        inCasti = ((abs(currentLatitude - targetLatitude) <= deadband) && (abs(currentLongitude - targetLongitude) <= deadband))
    }

}
