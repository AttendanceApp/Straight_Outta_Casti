//
//  OutViewController.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 3/6/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit

class OutViewController: UIViewController, UITextFieldDelegate {
    
    var stateController: StateController!
    @IBOutlet weak var reason: UITextField!
    let thumba = Thumba()
    let geofence: Geofence = Geofence(deadband: Constants.Geolocation.deadband, targetLatitude: Constants.Geolocation.castiLatitude, targetLongitude: Constants.Geolocation.castiLongitude)
    
    @IBOutlet weak var doneButton: UIButton!
        
    override func viewDidLoad() {
        doneButton.isHidden = true
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        self.reason.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(_ sender: UIButton) {
        if (reason.text != nil && geofence.inCasti) {
            thumba.setupController()
            thumba.updateUI(outViewController: self)
            reason.text = ""
            doneButton.isHidden = true
        } else if (reason.text != nil && !geofence.inCasti) {
            showAlert(title: "Sign Out Not Allowed", message: "You may not sign out if not on campus.", actions: [UIAlertAction(title: "I'll Remember", style: UIAlertActionStyle.default, handler: nil)], image: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
    
    func showAlert(title: String, message: String, actions: [UIAlertAction], image: UIImage?) {
        // set up the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        if (image != nil) {
            let imageView = UIImageView(frame: CGRect(x: 3, y: 3, width: 40, height: 40))
            imageView.image = image
            alert.view.addSubview(imageView)
        }
        
        // add the actions
        for action in actions {
            alert.addAction(action)
        }
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
        if reason != nil {
            doneButton.isHidden = false
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
