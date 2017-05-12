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
    
    
    static func doMyBidNiss(firstName: String, lastName: String, reason: String) {
        let myUrl = NSURL(string: Constants.GoogleForms.url)
        
        var request = URLRequest(url:myUrl! as URL)
        //NSMutableURLRequest(url: url! as URL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        request.httpMethod = "POST"
        let namesString = Constants.GoogleForms.firstNameEntry + firstName + Constants.GoogleForms.lastNameEntry + lastName
        let outString = Constants.GoogleForms.inoroutEntry + Constants.GoogleForms.inOrOut
        let reasonString = Constants.GoogleForms.reasonEntry + reason
        print ("REASON: " + reason)
        print ("REASONSTRING: " + reasonString)
        let fieldsToPost = namesString + outString + reasonString as NSString
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = fieldsToPost.data(using: String.Encoding.utf8.rawValue)
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(strData)
            print(error)
            print(response)
            print(myUrl)
        }
        task.resume()
    }
    
    
}
