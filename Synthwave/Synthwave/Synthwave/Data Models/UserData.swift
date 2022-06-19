////
////  UserData.swift
////  UserData
////
////  Created by Shashank datta Bezgam on 9/28/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import Combine
//import SwiftUI
//
//final class UserData: ObservableObject {
//
//    /*
//     ===============================================================================
//                         Publisher-Subscriber Design Pattern
//     ===============================================================================
//     | Publisher:   @Published var under class conforming to ObservableObject      |
//     | Subscriber:  Any View declaring '@EnvironmentObject var userData: UserData' |
//     ===============================================================================
//     
//     By modifying the first View to be shown, ContentView(), with '.environmentObject(UserData())' in
//     CatsApp, we inject an instance of this UserData() class into the environment and make it
//     available to every View subscribing to it by declaring '@EnvironmentObject var userData: UserData'.
//     
//     When a change occurs in userData (e.g., deleting a cat from the list, reordering cats list,
//     adding a new cat to the list), every View subscribed to it is notified to re-render its View.
//     ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//     NOTE:  Only Views can subscribe to it. You cannot subscribe to it within
//            a non-View Swift file such as our CatsData file.
//     ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//     */
//    
//    // Publish countriesList with initial value of catStructList obtained in CatsData
//    @Published var catsList = catsStructList
//    
//    /*
//     Publish searchableOrderedCatsList with initial value of
//     orderedSearchableCatsList obtained in CatsData
//     */
//    @Published var searchableOrderedCatsList = orderedSearchableCatsList
//    
//}
//
