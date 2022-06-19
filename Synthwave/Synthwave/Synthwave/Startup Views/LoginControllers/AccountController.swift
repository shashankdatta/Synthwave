//
//  AccountControllerModel.swift
//  Synthwave
//
//  Created by cs3714 on 2/1/22.
//  Copyright © 2022 Shashank & Dev. All rights reserved.
//

import Foundation
import FirebaseAuth

class AccountController: ObservableObject {
    let authenticator = Auth.auth()
    
    @Published var signedIn = false
    
//    fire.auth().createUserWithEmailAndPassword(this.state.email, this.state.password)
//      .then(u => {})
//      .catch(error => {
//         switch (error.code) {
//            case 'auth/email-already-in-use':
//              console.log(`Email address ${this.state.email} already in use.`);
//              break;
//            case 'auth/invalid-email':
//              console.log(`Email address ${this.state.email} is invalid.`);
//              break;
//            case 'auth/operation-not-allowed':
//              console.log(`Error during sign up.`);
//              break;
//            case 'auth/weak-password':
//              console.log('Password is not strong enough. Add additional characters including special characters and numbers.');
//              break;
//            default:
//              console.log(error.message);
//              break;
//          }
//      });
    
    var isSignedIn: Bool {
//        return authenticator.currentUser != nil || UserDefaults.standard.bool(forKey: "login")
        return authenticator.currentUser != nil
    }
    
    func signUp(email: String, password: String) {
        authenticator.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
//                self?.signOut()
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = false
            }
        }
    }
    
    func logIn(email: String, password: String) {
        authenticator.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                // Success
//                UserDefaults.standard.setIsLoggedIn(value: true)
//                print("Successful Login")
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? authenticator.signOut()
//        UserDefaults.standard.setIsLoggedIn(value: false)
        self.signedIn = false
    }
    
    func resetPassword(email: String) {
        authenticator.sendPasswordReset(withEmail: email) { error in
            guard error == nil else {
                return
            }
            
        }
    }
}
