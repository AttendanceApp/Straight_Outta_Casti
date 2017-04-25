
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
    let region: CLCircularRegion
    
    init (deadband: Double, targetLatitude: Double, targetLongitude: Double) {
        self.deadband = deadband
        self.targetLatitude = targetLatitude
        self.targetLongitude = targetLongitude
        self.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: targetLatitude, longitude: targetLongitude), radius: 50, identifier: "circle")
        super.init()
        self.locationManager.requestAlwaysAuthorization()
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.allowsBackgroundLocationUpdates = true
            locationManager.startMonitoring(for: region)
        }
        region.notifyOnEntry = true
        region.notifyOnExit = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        inCasti = region.contains(locations[locations.count-1].coordinate)
//        print (locations[locations.count-1].coordinate)
//        print (inCasti)
//        print (region.center)
//        print ()
        let currentLatitude = locations[locations.count-1].coordinate.latitude
        let currentLongitude = locations[locations.count-1].coordinate.longitude
        inCasti = ((abs(currentLatitude - targetLatitude) <= deadband) && (abs(currentLongitude - targetLongitude) <= deadband))
        if !inCasti {
            if (abs(currentLongitude - targetLongitude) <= deadband) {
                print ("Latitude off by:", abs(currentLatitude - targetLatitude))
            } else if (abs(currentLatitude - targetLatitude) <= deadband) {
                print ("Longitude off by:", abs(currentLongitude - targetLongitude))
            } else {
                print ("Latitude off by:", abs(currentLatitude - targetLatitude))
                print ("Longitude off by:", abs(currentLongitude - targetLongitude))
            }
        }
        print ("Latitude:", currentLatitude)
        print ("Longitude:", currentLongitude)
        print ("Region Contains:", region.contains(locations[locations.count-1].coordinate))
        print ("inCasti:", inCasti)
        print ()
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print ("entered region")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print ("exited region")
    }

}
