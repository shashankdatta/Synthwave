////
////  FavoritesList.swift
////  FavoritesList
////
////  Created by Shashank datta Bezgam on 9/28/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import SwiftUI
//
//struct FavoritesList: View {
//    
//    // Subscribe to changes in UserData
//    @EnvironmentObject var userData: UserData
//    
//    @State private var searchItem = ""
//    
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(userData.catsList)
//                { item in
//                    NavigationLink(destination: FavoriteDetails(cat: item))
//                    {
//                        FavoriteItem(cat: item)
//                    }
//                }
//                .onDelete(perform: delete)
//                .onMove(perform: move)
//                
//            }   // End of List
//            .navigationBarTitle(Text("Favorites"), displayMode: .inline)
//            
//            // Place the Edit button on left of the navigation bar
//            .navigationBarItems(leading: EditButton())
//            
//        }   // End of NavigationView
//            .customNavigationViewStyle()  // Given in NavigationStyle
//    }
//    
//    /*
//     -----------------------------
//     MARK: Delete Selected Cat
//     -----------------------------
//     */
//    func delete(at offsets: IndexSet) {
//        /*
//        'offsets.first' is an unsafe pointer to the index number of the array element
//        to be deleted. It is nil if the array is empty. Process it as an optional.
//        */
//        if let index = offsets.first {
//            userData.catsList.remove(at: index)
//            userData.searchableOrderedCatsList.remove(at: index)
//        }
//        // Set the global variable point to the changed list
//        catsStructList = userData.catsList
//        
//        // Set the global variable point to the changed list
//        orderedSearchableCatsList = userData.searchableOrderedCatsList
//        
//        // Set global flag defined in CountriesData
//        dataChanged = true
//    }
//    
//    /*
//     ---------------------------
//     MARK: Move Selected Cat
//     ---------------------------
//     */
//    func move(from source: IndexSet, to destination: Int) {
//
//        userData.catsList.move(fromOffsets: source, toOffset: destination)
//        userData.searchableOrderedCatsList.move(fromOffsets: source, toOffset: destination)
//        
//        // Set the global variable point to the changed list
//        catsStructList = userData.catsList
//        
//        // Set the global variable point to the changed list
//        orderedSearchableCatsList = userData.searchableOrderedCatsList
//        
//        // Set global flag defined in CountriesData
//        dataChanged = true
//    }
//}
//
//struct FavoritesList_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesList()
//    }
//}
//
