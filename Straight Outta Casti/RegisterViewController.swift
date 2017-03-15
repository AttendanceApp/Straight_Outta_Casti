//
//  RegisterViewController.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 3/2/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameEntry: UITextField!
    @IBOutlet weak var lastNameEntry: UITextField!
    var stateController: StateController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        let account = Account(firstName: firstNameEntry.text!, lastName: lastNameEntry.text!)
        stateController.set(account)
        self.performSegue(withIdentifier: "submitRegistration", sender: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "submitRegistration" {
            let controller = segue.destination as! OutViewController
            controller.stateController = self.stateController
        }
    }

}
