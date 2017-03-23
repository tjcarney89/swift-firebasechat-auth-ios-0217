//
//  ViewController.swift
//  Firechat
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(signIn), name: .googleSignIn, object: nil)
        
        
        
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .googleSignIn, object: nil)
    }
    
    @IBAction func registerBtnPressed(_ sender: Any) {
        if let email = self.usernameTextField.text, let password = self.passwordTextField.text {
            FirebaseManager.signUp(email: email, password: password, completion: { (user, success) in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let profileVC = storyboard.instantiateViewController(withIdentifier :"profileVC") as? ProfileViewController {
                    
                    
                    
                    self.present(profileVC, animated: true)
                }
                
                
            })
            
        }
        
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if let email = self.usernameTextField.text, let password = self.passwordTextField.text {
            FirebaseManager.login(email: email, password: password, completion: { (user, success) in
                
            })
            
        }
        
    }
    @IBAction func anonBtnPressed(_ sender: Any) {
    }
    
    func signIn(){
        
    }
    
}


extension Notification.Name {
    static let googleSignIn = Notification.Name("googleSignIn")
}

