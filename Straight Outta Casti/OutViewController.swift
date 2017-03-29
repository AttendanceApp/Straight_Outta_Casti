//
//  OutViewController.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 3/6/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit

class OutViewController: UIViewController {
    
    var stateController: StateController!
    @IBOutlet weak var reason: UITextField!
    let thumba = Thumba()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(_ sender: UIButton) {
        let account = stateController.get()
        if reason.text != nil {
            thumba.setupController()
            thumba.updateUI()
            GoogleFormsConnection.doMyBidNiss(firstName: account.firstName, lastName: account.lastName, reason: reason.text!)
        }
    }
    
    func showAlert() {
        // create the alert
        let alert = UIAlertController(title: "Sign Out Successful", message: "Would you like A reminder to sign in?", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let image = UIImage(named: "Checkmark")
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        action.setValue(image, forKey: "image")
        
        // add the actions
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "Remind Me", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "I'll Remember", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
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
