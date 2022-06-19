//
//  MainView.swift
//  Photo Album
//
//  Created by Osman Balci on 7/30/21.
//  Copyright © 2021 Osman Balci. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var menuViewService = MenuViewService()
    
    var body: some View {
        Group {
            TabView {
                Home()
                .tabItem {
                    Image(systemName: "house.fill")
//                            .imageScale(.medium)
//                            .foregroundColor(.gray)
                    Text("Home")
                }
                
    //            AddPhoto()
    //                .tabItem {
    //                    Image(systemName: "photo")
    //                    Text("Add Photo")
    //                }
    //            PhotosGrid()
    //                .tabItem {
    //                    Image(systemName: "square.grid.3x3")
    //                    Text("Photos Grid")
    //                }
    //            SlideShow()
    //                .tabItem {
    //                    Image(systemName: "slider.horizontal.below.rectangle")
    //                    Text("Slide Show")
    //                }
    //            Settings()
    //                .tabItem {
    //                    Image(systemName: "gear")
    //                    Text("Settings")
    //                }
                
            }   // End of TabView
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        menuViewService.isPresented.toggle()
        //                Menu() {
        //                    Button("Profile", action: profile)
        //                    Button("App Settings", action: appSettings)
        //                    Button("Sign out", action: cancelOrder)
        //                }
                    }) {
        //                Text("lol")
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(height: 15)
                    }
                }
            }
            .font(.headline)
            .imageScale(.medium)
            .font(Font.title.weight(.regular))
            .accentColor(.orange)
            .onAppear {
                // correct the transparency bug for Tab bars
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithOpaqueBackground()
                if #available(iOS 15.0, *) {
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                } else {
                    // Fallback on earlier versions
                }
                // correct the transparency bug for Navigation bars
                let navigationBarAppearance = UINavigationBarAppearance()
                navigationBarAppearance.configureWithOpaqueBackground()
                UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            }
        }
        .environmentObject(menuViewService)
        .slideInView(isActive: $menuViewService.isPresented,
                     edge: .leading, paddingPercentage: 0.55) {
            MenuView()
        }
    }
}
