//
//  Home.swift
//  Home
//
//  Created by Shashank datta Bezgam on 9/28/21.
//  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
//

import SwiftUI
import Foundation

var catImgUrlStr = ""

struct Home: View {
    @EnvironmentObject var menuViewService: MenuViewService
//    let numberOfPhotos = 20
//    @State private var dummy = 1
    
    var body: some View {
        Form {
            Text("PlaceHolder")
        }
//
//        ScrollView(.vertical, showsIndicators: false) {
//            Color.indigo.opacity(0.2).edgesIgnoringSafeArea(.all)
//            VStack {
//                photoImage(int: dummy, str: catImgUrlStr)
//                    .padding(.top, 30)
//                    .padding(.bottom, 20)
//                    .padding(.leading, 10)
//                    .padding(.trailing, 10)
//
//                Button(action: {
//                    dummy = Int.random(in: 1...numberOfPhotos)
//                    getRandomUrl()
//                }) {
//                    Text("Show Another Random Cat Photo")
//                        .foregroundColor(.blue)
//                        .bold()
//                        .padding()
//                }
//
//                Text("Powered By:")
//                    .foregroundColor(.black)
//                    .bold()
//                    .padding()
//
//                Link(destination: URL(string: "https://thecatapi.com")!) {
//                    HStack {
//                        Image("CatApiLogo")
//                            .frame(height: 80, alignment: .center)
//                    }
//                    .padding(10)
//                }
//
//            }   // End of VStack
//        }   // End of ScrollView
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        // UNCOMMENT FOR SIDE MENU UNDER NAVIGATION BAR AND TABBAR
//        .slideInView(isActive: $menuViewService.isPresented,
//                     edge: .leading, paddingPercentage: 0.55) {
//            MenuView()
//        }
    }
}

// Menu Functions
//func profile() { }
//func appSettings() { }

func photoImage(int: Int, str: String) -> some View {
    return AnyView(
        getImageFromUrl(url: str, defaultFilename: "ImageUnavailable")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minWidth: 100, maxWidth: 500, alignment: .center)
            .padding()
    )
}

//func getRandomUrl() {
//    let apiUrl = "https://api.thecatapi.com/v1/images/search"
//
//    let apiQueryUrlStruct: URL?
//
//    if let urlStruct = URL(string: apiUrl) {
//        apiQueryUrlStruct = urlStruct
//    } else {
//        return
//    }
//
//    let headers = [
//        "x-api-key": "d43c08da-554f-46fa-8003-0edb2a58d428",
//        "accept": "application/json",
//        "cache-control": "no-cache",
//        "host": "api.thecatapi.com"
//    ]
//
//    let request = NSMutableURLRequest(url: apiQueryUrlStruct!,
//                                      cachePolicy: .useProtocolCachePolicy,
//                                      timeoutInterval: 10.0)
//
//    request.httpMethod = "GET"
//    request.allHTTPHeaderFields = headers
//
//    let semaphore = DispatchSemaphore(value: 0)
//
//    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//        guard error == nil else {
//            semaphore.signal()
//            return
//        }
//
//        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//            semaphore.signal()
//            return
//        }
//
//        guard let jsonDataFromApi = data else {
//            semaphore.signal()
//            return
//        }
//
//        do {
//            let jsonResponse = try JSONSerialization.jsonObject(with: jsonDataFromApi,
//                               options: JSONSerialization.ReadingOptions.mutableContainers)
//
//            var catDataDictionary = Dictionary<String, Any>()
//            if let jsonArray = jsonResponse as? [Any] {
//                for aJsonObject in jsonArray {
//                    if let jsonObject = aJsonObject as? [String: Any] {
//                        catDataDictionary = jsonObject
//                    } else {
//                        return
//                    }
//                }   // End of 'for loop'
//            } else {
//                return
//            }
//
//            if let url = catDataDictionary["url"] as? String {
//                catImgUrlStr = url
//            } else {
//                return
//            }
//        } catch {
//            semaphore.signal()
//            return
//        }
//
//        semaphore.signal()
//    }).resume()
//
//    // If the resulting value is less than zero, this function waits for a signal to occur before returning.
//    _ = semaphore.wait(timeout: .now() + 10)
//}
