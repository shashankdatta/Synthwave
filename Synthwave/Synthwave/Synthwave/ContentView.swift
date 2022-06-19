//
//  ContentView.swift
//  Photo Album
//
//  Created by Osman Balci on 7/30/21.
//  Copyright © 2021 Osman Balci. All rights reserved.
//

import Foundation
import Firebase
import Combine
import SwiftUI

// WORKS
struct ContentView : View {

    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var menuViewService: MenuViewService
    @State private var userLoggedIn = false
    @State private var isLoading = false
    
    @State var justSignedOut = false
    @State private var showSignedOutAlert = false

    var body: some View {
        ZStack {
            if (userLoggedIn) {
                NavigationView{
                    MainView()
                }
                .navigationViewStyle(.stack)
                .onAppear{
                    startFakeNetworkCall()
                    Auth.auth().addStateDidChangeListener { (auth, user) in
                        if user == nil {
    //                        print(user?.uid)
    //                        print(user?.email)
                            userLoggedIn.toggle()
                            justSignedOut = true
                        }
                    }
                }
            } else {
                NavigationView{
                    LoginView()
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .onAppear{
                    startFakeNetworkCall()
                    Auth.auth().addStateDidChangeListener { (auth, user) in
                        if user != nil {
    //                        print(user?.uid)
    //                        print(user?.email)
                            userLoggedIn.toggle()
                        }
                    }
                }
            }
            if (isLoading) {
                LoadingView()
                    .onAppear{
                        if (justSignedOut) {
                            showSignedOutAlert = true
                        }
                    }
                    .alert(isPresented: $showSignedOutAlert, content: { accountSignedOutAlert })
            }
        }
    }

    //-----------------------
    // Signed out Password Alert
    //-----------------------
    var accountSignedOutAlert: Alert {
        Alert(title: Text("You have succefully logged out"),
              message: Text("Have a great day!"))
    }
    
    func startFakeNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
//                .opacity(0.50)
//            ProgressView()
//                .progressViewStyle(CircularProgressViewStyle(tint: .orange))
//                .scaleEffect(2)
            GifImage("loading1")
                .frame(width: 150, height: 150, alignment: .center)
        }
        .allowsHitTesting(true)
        .disabled(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
