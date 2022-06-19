//
//  CatsApp.swift
//  Cats
//
//  Created by Shashank datta Bezgam on 9/28/21.
//  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
//

import SwiftUI

@main
struct SynthwaveApp: App {
    /*
     Use the UIApplicationDelegateAdaptor property wrapper to direct SwiftUI
     to use the AppDelegate class for the application delegate.
     */
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    /*
     @Environment property wrapper for SwiftUI's pre-defined key scenePhase is declared to
     monitor changes of app's life cycle states such as active, inactive, or background.
     The \. indicates that we access scenePhase by its object reference, not by its value.
     */
    @Environment(\.scenePhase) private var scenePhase
    
    @EnvironmentObject var accountController: AccountController
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var menuViewService: MenuViewService
    
    var body: some Scene {
        WindowGroup {
            // ContentView is the root view to be shown first upon app launch
            ContentView()
            
                /*
                 Inject an instance of UserData() class into the environment and
                 make it available to every View subscribing to it.
                 */
                .environmentObject(AccountController())
                .environmentObject(SessionStore())
                .environmentObject(MenuViewService())
        }
    }
}
