//
//  Utils.swift
//  Straight Outta Casti
//
//  Created by Drew Leary on 3/6/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    // MARK: NSNotificationCenter Management
    
    class func registerNotificationWillEnterForeground(observer: AnyObject, selector: Selector) {
        // Handle when the app becomes active, going from the background to the foreground
        NotificationCenter.default.addObserver(observer, selector: selector, name: .UIApplicationWillEnterForeground, object: nil)
    }
    
    class func removeObserverForNotifications(observer: AnyObject) {
        NotificationCenter.default.removeObserver(observer)
    }
}
