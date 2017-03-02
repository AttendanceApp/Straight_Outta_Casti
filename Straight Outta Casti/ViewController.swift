//
//  ViewController.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 2/16/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit

// kenzie is stupid 

class ViewController: UIViewController {


    //VANESSA: Are you kitten me right meow?
    // liz has made a comment
    let geofence: Geofence = Geofence(latitudeDeadband: Constants.Geolocation.latitudeDeadband, longitudeDeadband: Constants.Geolocation.longitudeDeadband, targetLatitude: Constants.Geolocation.castiLatitude, targetLongitude: Constants.Geolocation.castiLongitude)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

