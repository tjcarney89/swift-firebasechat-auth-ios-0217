//
//  FirebaseManager.swift
//  Firechat
//
//  Created by Johann Kerr on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import FirebaseAuth


typealias AuthSuccess = (Bool) -> ()
typealias UserSuccess = (FIRUser?, Bool) -> ()

class FirebaseManager {
    
    class func login(email: String, password:String, completion: @escaping UserSuccess) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if let newUser = user {
                completion(newUser, true)
            } else {
                completion(nil, false)
            }
        })
    }
    
    class func signUp(email: String, password: String, completion: @escaping UserSuccess) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if let newUser = user {
                completion(newUser, true)
            } else {
                completion(nil, false)
            }
            
        })
    }
    
    class func reset(email: String, completion: @escaping AuthSuccess) {
        FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error) in
            if error != nil {
                completion(true)
            } else {
                completion(false)
            }
        })
    }
    
    class func confirm(code:String, password: String, completion: @escaping AuthSuccess) {
        FIRAuth.auth()?.confirmPasswordReset(withCode: code, newPassword: password, completion: { (error) in
            if error != nil {
                completion(true)
            } else {
                completion(false)
            }
            
        })
    }
    
    class func logOut(completion:(Bool)->()) {
        
        do {
            try FIRAuth.auth()?.signOut()
            completion(true)
        } catch {
            completion(false)
        }
        
    }
}


