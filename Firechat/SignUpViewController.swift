//
//  SignUpViewController.swift
//  Firechat
//
//  Created by TJ Carney on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if !emailTextField.hasText || !passwordTextField.hasText || !usernameTextField.hasText {
            let myAlert = UIAlertController(title: "All Fields Required", message: "Please Enter Text", preferredStyle: .alert)
            let myAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            myAlert.addAction(myAction)
            self.present(myAlert, animated: true)
        } else {
            
        
            if let email = emailTextField?.text, let password = passwordTextField?.text {
                FirebaseManager.signUp(email: email, password: password, completion: { (user, success) in
                    if let unwrappedEmail = user?.email, let unwrappedUsername = self.usernameTextField.text {
                        print(unwrappedEmail)
                        FirebaseManager.addUser(email: unwrappedEmail, username: unwrappedUsername)
                    }
                    print("\(user?.email) has signed up")
                })
                self.dismiss(animated: true, completion: nil)
            }
            
            
        }

    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let myAlert = UIAlertController(title: "Cancel Sign Up", message: "Are you sure?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        myAlert.addAction(yesAction)
        myAlert.addAction(noAction)
        self.present(myAlert, animated: true)
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
