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
        static let castiLatitude: Double = 37.4386964
        static let castiLongitude: Double = -122.152027
        static let deadband: Double = 0.001354
    }
    
    struct GoogleForms {
        //add your strings for Google Forms here so that they're easy to access and change centrally
        //For example:
        static let firstNameEntry: String = "entry.42768537="
        static let lastNameEntry: String = "&entry.1877164239="
        static let reasonEntry: String = "&entry.674640187="
        static let url: String = "https://docs.google.com/a/castilleja.org/forms/d/e/1FAIpQLSefSGzX46w4W8K_l3L68GndYLitfGvjA_u4jmVUWFbpIYmskA/formResponse"
    }
    
    struct Notifications {
        static let center: UNUserNotificationCenter = UNUserNotificationCenter.current()
        static let options: UNAuthorizationOptions = [.alert, .sound];
        static let content = UNMutableNotificationContent()
    }
    
    struct Remote {
        static var go = true
    }
}
