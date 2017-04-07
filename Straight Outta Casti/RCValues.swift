//
//  RCValues.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 4/7/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import Firebase

class RCValues {
    
    static let sharedInstance = RCValues()
    
    private init () {
        loadDefaultValues()
        fetchCloudValues()
    }
    
    func loadDefaultValues() {
        let appDefaults: [String: NSObject] = [
            "formURL" : "https://docs.google.com/a/castilleja.org/forms/d/e/1FAIpQLSefSGzX46w4W8K_l3L68GndYLitfGvjA_u4jmVUWFbpIYmskA/formResponse" as NSObject
        ]
        FIRRemoteConfig.remoteConfig().setDefaults(appDefaults)
    }
    
    func fetchCloudValues() {
        let fetchDuration: TimeInterval = 0
        activateDebugMode()
        FIRRemoteConfig.remoteConfig().fetch(withExpirationDuration: fetchDuration) {
            [weak self] (status, error) in
            
            guard error == nil else {
                print ("Uh-oh. Got an error fetching remote values \(error)")
                return
            }
            
            FIRRemoteConfig.remoteConfig().activateFetched()
            print ("Retrieved values from the cloud!")
            Constants.GoogleForms.url = FIRRemoteConfig.remoteConfig().configValue(forKey: "formURL").stringValue!
        }
    }
    
    
    func activateDebugMode() {
        let debugSettings = FIRRemoteConfigSettings(developerModeEnabled: true)
        FIRRemoteConfig.remoteConfig().configSettings = debugSettings!
    }
    
}
