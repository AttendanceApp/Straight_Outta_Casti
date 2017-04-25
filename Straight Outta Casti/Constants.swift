//
//  Constants.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 2/17/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import UserNotifications

class Constants {
    struct Geolocation {
        static let castiLatitude: Double = 37.4385029264143
        static let castiLongitude: Double = -122.151743983964
        static let deadband: Double = 0.0005
    }
    
    struct GoogleForms {
        //add your strings for Google Forms here so that they're easy to access and change centrally
        //For example:
        static let firstNameEntry: String = "entry.969444259="
        static let lastNameEntry: String = "&entry.30603988="
        static let inoroutEntry: String = "&entry.1033565684="
        static let reasonEntry: String = "&entry.480295091="
        static let usernameEntry: String = "&entry.2039457445="
        static let url: String = "https://docs.google.com/a/castilleja.org/forms/d/e/1FAIpQLSf3eqWNn3VcSl2agC3d1A2oP_GZ7lFyglIL6_0qjk3Ia30rPA/formResponse"
    }
    
    struct Remote {
        static let thisVersion = 1.0
        static var latestVersion = 1.0
    }
}
