//
//  Thumba.swift
//  Straight Outta Casti
//
//  Created by Drew Leary on 3/6/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//


import UIKit
import LocalAuthentication

class Thumba {
    
    let kMsgShowReason = "Sign Out"
    
    var context = LAContext()
    
    deinit {
        Utils.removeObserverForNotifications(observer: self)
    }
    
    func setupController() {
        Utils.registerNotificationWillEnterForeground(observer: self, selector: #selector(Thumba.updateUI))
        
        // The Refresh button will let us to repeat the login process so many times as we want
    }
    
    @objc func updateUI() {
        var policy: LAPolicy?
        // Depending the iOS version we'll need to choose the policy we are able to use
        if #available(iOS 9.0, *) {
            // iOS 9+ users with Biometric and Passcode verification
            // Is changing this to ...WithBiometrics necessary? Is it sufficient to set fallback title to empty? Are there any negative ramifications to using WithBiometrics?
            policy = .deviceOwnerAuthenticationWithBiometrics
            context.localizedFallbackTitle = ""
        } else {
            // iOS 8+ users with Biometric and Custom (Fallback button) verification
            context.localizedFallbackTitle = ""
            policy = .deviceOwnerAuthenticationWithBiometrics
        }
        
        var err: NSError?
        
        // Check if the user is able to use the policy we've selected previously
        
        
        loginProcess(policy: policy!)
    }
    
    private func loginProcess(policy: LAPolicy) {
        // Start evaluation process with a callback that is executed when the user ends the process successfully or not
        context.evaluatePolicy(policy, localizedReason: kMsgShowReason) { (success, error) in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.5, animations: {
                })
            }
        }
    }
    
    
    
    func resetContextState() {
        // Initialize our context object just in this example, in a real app it shouldn't be necessary. In fact, we should avoid this initialization
        // The reason is because once our LAContext detects that the login was successfully done, it won't let us repeat the login process again
        self.context = LAContext()
        
        
        
        self.updateUI()
    }
    
    
    
    
}
