
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
        self.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: targetLatitude, longitude: targetLongitude), radius: deadband, identifier: "circle")
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
        let lastLatitude = locations[locations.count-1].coordinate.latitude
        let lastLongitude = locations[locations.count-1].coordinate.longitude
        inCasti = ((abs(lastLatitude - targetLatitude) <= longitudeDeadband) && (abs(lastLongitude - targetLongitude) <= longitudeDeadband))
        print("Latitude:", lastLatitude, "Longitude:", lastLongitude)
        print("Latitude Difference:", abs(lastLatitude - targetLatitude))
        print("Longitude Difference:", abs(lastLongitude - targetLongitude))
        print()
    }
}
