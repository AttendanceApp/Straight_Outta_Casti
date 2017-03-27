//
//  Constants.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 2/17/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation

class Constants {
    struct Geolocation {
        static let castiLatitude: Double = 37.438696
        static let castiLongitude: Double = -122.152208
        static let deadband: Double = 0.005
    }
    
    struct GoogleForms {
        //add your strings for Google Forms here so that they're easy to access and change centrally
        //For example:
        static let firstNameEntry: String = "entry.42768537="
        static let lastNameEntry: String = "&entry.1877164239="
        static let reasonEntry: String = "&entry.674640187="
        static let url: String = "https://docs.google.com/a/castilleja.org/forms/d/e/1FAIpQLSefSGzX46w4W8K_l3L68GndYLitfGvjA_u4jmVUWFbpIYmskA/formResponse"
    }
}
