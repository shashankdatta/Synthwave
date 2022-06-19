//
//  AppDelegate.swift
//  AppDelegate
//
//  Created by Shashank datta Bezgam on 9/28/21.
//  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
//

import SwiftUI
import UIKit
import Firebase
import FirebaseDatabase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /*
         *****************************************
         Read Cats data files upon app launch
         *****************************************
         */
//        readCatsDataFiles()            // In CatsData
//        getRandomUrl()
        FirebaseApp.configure()
        
//        let ref = Database.database().reference()
//        ref.child("rohithshenoy").observeSingleEvent(of: .value) { (snapshot) in
//            let values = snapshot.value as? [String: Any]
//            print(values!["First Name"]!)
//        }
        return true
    }
}
