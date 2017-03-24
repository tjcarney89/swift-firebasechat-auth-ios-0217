//
//  ViewController.swift
//  Firechat
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            FirebaseManager.login(email: email, password: password, completion: { (user, success) in
                if success == true {
                    self.performSegue(withIdentifier: "loginSegue", sender: self)
                } else if success == false {
                    let myAlert = UIAlertController(title: "User Does Not Exist", message: "Please Click 'Sign Up' to Create Accout", preferredStyle: .alert)
                    let myAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    myAlert.addAction(myAction)
                    self.present(myAlert, animated: true)
                }
            })
        }
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
       
//            if let email = newEmailTextField?.text, let password = newpasswordTextField?.text {
//                FirebaseManager.signUp(email: email, password: password, completion: { (user, success) in
//                    if let unwrappedEmail = user?.email {
//                        print(unwrappedEmail)
//                        FIRDatabase.database().reference().child("User").child("Account").setValue(unwrappedEmail)
//                    }
//                    print("\(user?.email) has signed up")
//                })
//                
//                
//
//            }
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue" {
            if let destVC = segue.destination as? WelcomeViewController, let email = emailTextField.text {
                destVC.userEmail = email
            }
        }
    }
   
    @IBAction func logoutTapped(_ sender: Any) {
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        let myAlert = UIAlertController(title: "Reset Password", message: "Enter Email", preferredStyle: .alert)
        myAlert.addTextField()
        let resetAction = UIAlertAction(title: "Reset Password", style: .default) { (action) in
            if let email = myAlert.textFields?[0].text {
                FirebaseManager.resetPassword(email: email)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        myAlert.addAction(resetAction)
        myAlert.addAction(cancelAction)
        self.present(myAlert, animated: true)
    }
    
    
}
