//
//  AppDelegate.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 2/16/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: Variables
    var window: UIWindow?
    
    let stateController = StateController(accountStorage: AccountStorage())
    
    let geofence: Geofence = Geofence(latitudeDeadband: Constants.Geolocation.latitudeDeadband, longitudeDeadband: Constants.Geolocation.longitudeDeadband, targetLatitude: Constants.Geolocation.castiLatitude, targetLongitude: Constants.Geolocation.castiLongitude)
    
    let center = UNUserNotificationCenter.current()
    let options: UNAuthorizationOptions = [.alert, .sound];
    let content = UNMutableNotificationContent()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //MARK: Starting ViewController
        // If not on Casti, app doesn't work, if on Casti, register or direct to sign out screen
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        if !geofence.inCasti {
//            let geoDisabledController = storyboard.instantiateViewController(withIdentifier: "GeoDisabledViewController") as! GeoDisabledViewController
//            self.window?.makeKeyAndVisible()
//            self.window?.rootViewController = geoDisabledController
//        } else 
        if !stateController.hasUserInfo() {
            let registerController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            registerController.stateController = self.stateController
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = registerController
        } else {
            let signOutController = storyboard.instantiateViewController(withIdentifier: "OutViewController") as! OutViewController
            signOutController.stateController = self.stateController
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = signOutController
        }
        
        //MARK: LocalNotifications
        center.requestAuthorization(options: options) {
            (granted, error) in
            if granted {
                self.stateController.allowNotifications = true
            } else {
                self.stateController.allowNotifications = false
            }
        }
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                self.stateController.allowNotifications = true
            } else {
                self.stateController.allowNotifications = false
            }
        }
        content.title = "Don't forget to sign in! :)"
        content.body = "Welcome back to campus."
        content.sound = UNNotificationSound.default()
        let trigger = UNLocationNotificationTrigger(region: geofence.region, repeats: false)
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print (error)
            }
        })

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

