//
//  DoneViewController.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 3/23/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit
import UserNotifications

class DoneViewController: UIViewController {

    var stateController: StateController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stateController.wantNotifications = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reminderSwitch(_ sender: UISwitch) {
        stateController.wantNotifications = sender.isOn
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
