//
//  WelcomeViewController.swift
//  Firechat
//
//  Created by TJ Carney on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutTapped(_ sender: Any) {
        if FIRAuth.auth()?.currentUser != nil {
            FirebaseManager.logOut(completion: {(success) in
                print("Successfully Logged Out")
                dismiss(animated: true, completion: nil)
            })
        } else {
            print("No User To Log Out")
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
