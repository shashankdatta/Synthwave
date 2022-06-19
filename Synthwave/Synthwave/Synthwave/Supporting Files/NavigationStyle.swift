//
//  NavigationStyle.swift
//  TravelAid
//
//  Created by Shashank datta Bezgam on 10/30/21.
//  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
//

import SwiftUI

extension View {
    
    public func customNavigationViewStyle() -> some View {

        if UIDevice.current.userInterfaceIdiom == .phone {
            // Use single column navigation view for iPhone
            return AnyView(navigationViewStyle(StackNavigationViewStyle()))
        } else {
            // Use double column navigation view for iPad
            return AnyView(self
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
                .padding(.leading, 1)
            )
        }
    }
    
}
