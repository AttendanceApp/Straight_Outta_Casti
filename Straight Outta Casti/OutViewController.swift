//
//  SignOutViewController.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 3/6/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit

class OutViewController: UIViewController {
    
    var stateController: StateController!
    @IBOutlet weak var reason: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Thumba.setupController()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        Thumba.updateUI()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(_ sender: UIButton) {
        let account = stateController.get()
        if reason.text != nil {
            GoogleFormsConnection.doMyBidNiss(firstName: account.firstName, lastName: account.lastName, reason: reason.text!)
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
