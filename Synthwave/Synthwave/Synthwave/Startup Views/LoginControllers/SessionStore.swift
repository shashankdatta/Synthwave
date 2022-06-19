//
//  SessionStore.swift
//  Synthwave
//
//  Created by Shashank datta Bezgam on 2/28/22.
//  Copyright © 2022 Shashank & Dev. All rights reserved.
//

import Foundation
import Firebase
import Combine
import SwiftUI

class SessionStore : ObservableObject {
    var handle: AuthStateDidChangeListenerHandle?
    
//    func listen () {
//        // monitor authentication changes using firebase
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            if user != nil {
//                userLoggedIn = true
//            } else {
//                userLoggedIn = false
//            }
//        }
//    }
    
//    func check() -> Bool {
//        var flg = false
//        Auth.auth().addStateDidChangeListener { (auth, user) in
//            if user != nil {
//                flg = true
//            }
//        }
//        return flg
//    }

    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }

    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            return false
        }
    }
    
//    func unbind () {
//        if let handle = handle {
//            Auth.auth().removeStateDidChangeListener(handle)
//        }
//    }
}
