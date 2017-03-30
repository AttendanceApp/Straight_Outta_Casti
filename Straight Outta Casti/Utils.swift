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
    
    class func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
