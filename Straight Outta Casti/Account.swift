//
//  Login.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 3/2/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation

struct Account {
    let firstName: String
    let lastName: String
    let status: String
}

extension Account {
    var plistRepresentation: [String: AnyObject] {
        return [
            "firstName": firstName as AnyObject,
            "lastName": lastName as AnyObject,
            "status": status as AnyObject
        ]
    }
    
    init (plist: [String: AnyObject]) {
        firstName = plist["firstName"] as! String
        lastName = plist["lastName"] as! String
        status = plist["status"] as! String
    }
}
