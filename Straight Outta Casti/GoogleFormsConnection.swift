//
//  GoogleFormsConnection.swift
//  Straight Outta Casti
//
//  Created by Liz Parker on 3/2/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import UIKit

class GoogleFormsConnection {
    var firstName = "First"
    var lastName = "Last"
    var reason = "reason"
    var out = "out"
    
    
    static func doMyBidNiss(firstName: String, lastName: String, reason: String) {
        let myUrl = NSURL(string: "https://docs.google.com/a/castilleja.org/forms/d/e/1FAIpQLSdY6ks151DSYNytLyQ3aafNqvhmtF99MJPU95lAWVVRwt846g/formResponse")
        
        var request = URLRequest(url:myUrl! as URL)
        //NSMutableURLRequest(url: url! as URL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        request.httpMethod = "POST"
        let fieldsToPost = "entry.1266582852=" + firstName + "&entry.2132189692=" + lastName + "&entry.1341441446=" + reason as NSString
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = fieldsToPost.data(using: String.Encoding.utf8.rawValue)
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(strData)
            print(error)
            print(response)
        }
        task.resume()
    }
    
    
}
