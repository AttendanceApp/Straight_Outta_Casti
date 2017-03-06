//
//  ViewController.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 2/16/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit

class SignOutViewController: UIViewController {

//    let geofence: Geofence = Geofence(latitudeDeadband: Constants.Geolocation.latitudeDeadband, longitudeDeadband: Constants.Geolocation.longitudeDeadband, targetLatitude: Constants.Geolocation.castiLatitude, targetLongitude: Constants.Geolocation.castiLongitude)
    var stateController: StateController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Thumba.setupController()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Thumba.updateUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
