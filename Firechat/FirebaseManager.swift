//
//  FirebaseManager.swift
//  Firechat
//
//  Created by Johann Kerr on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import FirebaseAuth



class FirebaseManager {
    
    class func login(email: String, password:String, completion: @escaping (FIRUser?, Bool) -> ()) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                if let verifiedUser = user {
                    completion(verifiedUser, true)
                }
            } else {
                completion(nil, false)
            }
            
        })
    }
    
    class func signUp(email: String, password: String, completion: @escaping (FIRUser?, Bool) -> ()) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            completion(user, true)
            print(user?.email)
        })
    }
    
    class func logOut(completion: (Bool) -> ()) {
        do{
            try FIRAuth.auth()?.signOut()
            completion(true)
            
        } catch {
        
        }
    }
    
    class func resetPassword(email: String) {
        FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error) in
            print(error)
        })
    }
    
}

