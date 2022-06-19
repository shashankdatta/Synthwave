////
////  FavoritesItem.swift
////  FavoritesItem
////
////  Created by Shashank datta Bezgam on 9/28/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import SwiftUI
//
//struct FavoriteItem: View {
//    
//    // Input Parameter
//    let cat: Cat
//    
//    var body: some View {
//        HStack {
//            // Public function getImageFromUrl is given in UtilityFunctions.swift
//            getImageFromUrl(url: cat.url, defaultFilename: "ImageUnavailable")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 100.0)
//            
//            VStack(alignment: .leading) {
//                Text(cat.name)
//                HStack {
//                    Text("id: ")
//                    Text(cat.id)
//                }
//                HStack {
//                    Text("Life Span: ")
//                    Text(cat.life_span)
//                }
//                HStack {
//                    Text("Weight: ")
//                    Text(cat.weight)
//                }
//            }
//            // Set font and size for the whole VStack content
//            .font(.system(size: 14))
//            
//        }   // End of HStack
//    }
//}
//
//struct FavoriteItem_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteItem(cat: catsStructList[0])
//    }
//}
