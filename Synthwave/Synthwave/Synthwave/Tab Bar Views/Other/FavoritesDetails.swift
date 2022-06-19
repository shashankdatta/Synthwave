////
////  FavoritesDetails.swift
////  FavoritesDetails
////
////  Created by Shashank datta Bezgam on 9/28/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import SwiftUI
//
//struct FavoriteDetails: View {
//    
//    // Input Parameter
//    let cat: Cat
//    
//    var body: some View {
//        // A Form cannot have more than 10 Sections.
//        // Group the Sections if more than 10.
//        Form {
//            Section(header: Text("CAT BREED IDENTIFICATION CODE")) {
//                Text(cat.id)
//            }
//            Section(header: Text("CAT BREED NAME")) {
//                Text(cat.name)
//            }
//            Section(header: Text("CAT PHOTO")) {
//                getImageFromUrl(url: cat.url, defaultFilename: "ImageUnavailable")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(minWidth: 300, maxWidth: 500, alignment: .center)
//            }
//            Section(header: Text("CAT BREED DESCRIPTION")) {
//                Text(cat.description)
//            }
//            Section(header: Text("CAT BREED TEMPERAMENT")) {
//                Text(cat.temperament)
//            }
//            Section(header: Text("CAT BREED ORIGIN")) {
//                Text(cat.origin)
//            }
//            Section(header: Text("CAT BREED LIFE SPAN IN YEARS")) {
//                Text(cat.life_span)
//            }
//            Section(header: Text("CAT WEIGHT IN POUNDS")) {
//                Text(cat.weight)
//            }
//            Section(header: Text("MORE INFO AT VETSTREET.COM")) {
//                if (cat.vetstreet_url.isEmpty) {
//                    NavigationLink(destination: NotFoundUrl()) {
//                        HStack {
//                            Image(systemName: "globe")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                                .foregroundColor(.black)
//                            Text("See more info on \(cat.name)")
//                                .font(.system(size: 16))
//                        }
//                        .frame(minWidth: 300, maxWidth: 500, alignment: .leading)
//                    }
//                }
//                else {
//                    NavigationLink(destination: WebView(url: cat.vetstreet_url)) {
//                        HStack {
//                            Image(systemName: "globe")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                                .foregroundColor(.black)
//                            Text("See more info on \(cat.name)")
//                                .font(.system(size: 16))
//                        }
//                        .frame(minWidth: 300, maxWidth: 500, alignment: .leading)
//                    }
//                }
//            }
//        }
//            .navigationBarTitle(Text("Cat Breed Details"), displayMode: .inline)
//            .font(.system(size: 14))
//
//    }   // End of Form
//}
//
//
//struct FavoriteDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteDetails(cat: catsStructList[0])
//    }
//}
//
