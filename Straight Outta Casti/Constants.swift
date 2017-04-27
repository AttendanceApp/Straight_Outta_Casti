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
        static let castiLatitude: Double = 37.4387182575068
        static let castiLongitude: Double = -122.151539381707
        static let deadband: Double = 0.001
    }
    
    struct GoogleForms {
        //add your strings for Google Forms here so that they're easy to access and change centrally
        //For example:
        static let firstNameEntry: String = "entry.719932306="
        static let lastNameEntry: String = "&entry.2099651079="
        static let inoroutEntry: String = "&entry.1000867194="
        static let reasonEntry: String = "&entry.216097747="
        static let usernameEntry: String = "&entry.2039457445="
        static let url: String = "https://docs.google.com/a/castilleja.org/forms/d/e/1FAIpQLSd45NAgMrking44KoafkYnlQ8WYSSmx5gWE4Xlz_yQoWDsbzQ/formResponse"
    }
    
    struct Remote {
        static let thisVersion = 1.0
        static var latestVersion = 1.0
    }
}
