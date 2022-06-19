////
////  CatApiData.swift
////  CatApiData
////
////  Created by Shashank datta Bezgam on 9/28/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import Foundation
//import SwiftUI
//
//// Declare locatedCat as a global mutable variable accessible in all Swift files
//var locatedCat = Cat(id: "", name: "", vetstreet_url: "", temperament: "", origin: "", description: "", life_span: "", weight: "", url: "")
//
//fileprivate var previousQuery = ""
//
///*
//==================================
//MARK: Obtain Cat Data from API
//==================================
//*/
//public func obtainCatDataFromApi(query: String) {
//    // Initialization
//    locatedCat = Cat(id: "", name: "", vetstreet_url: "", temperament: "", origin: "", description: "", life_span: "", weight: "", url: "")
//    
//    if query == previousQuery {
//        return
//    } else {
//        previousQuery = query
//    }
//    
//    
//    /*
//     *********************************************
//     *   Obtaining API Search Query URL Struct   *
//     *********************************************
//     */
//    
//    // Replace space with Unicode Transformation Format 8-bit (UTF-8) encoding of space with %20
//
//    let apiUrl = "https://api.thecatapi.com/v1/images/search?breed_id=\(query)"
//    /*
//     searchQuery may include unrecognizable foreign characters inputted by the user,
//     e.g., Côte d'Ivoire, that can prevent the creation of a URL struct from the
//     given apiUrl string. Therefore, we must test it as an Optional.
//    */
//    var apiQueryUrlStruct: URL?
//    
//    if let urlStruct = URL(string: apiUrl) {
//        apiQueryUrlStruct = urlStruct
//    } else {
//        // locatedCat will have the initial values set as above
//        return
//    }
//
//    /*
//    *******************************
//    *   HTTP GET Request Set Up   *
//    *******************************
//    */
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
//    /*
//    *********************************************************************
//    *  Setting Up a URL Session to Fetch the JSON File from the API     *
//    *  in an Asynchronous Manner and Processing the Received JSON File  *
//    *********************************************************************
//    */
//    
//    /*
//     Create a semaphore to control getting and processing API data.
//     signal() -> Int    Signals (increments) a semaphore.
//     wait()             Waits for, or decrements, a semaphore.
//     */
//    let semaphore = DispatchSemaphore(value: 0)
//
//    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//        /*
//        URLSession is established and the JSON file from the API is set to be fetched
//        in an asynchronous manner. After the file is fetched, data, response, error
//        are returned as the input parameter values of this Completion Handler Closure.
//        */
//
//        // Process input parameter 'error'
//        guard error == nil else {
//            // locatedCat will have the initial values set as above
//            semaphore.signal()
//            return
//        }
//        
//        /*
//         ---------------------------------------------------------
//         🔴 Any 'return' used within the completionHandler Closure
//            exits the Closure; not the public function it is in.
//         ---------------------------------------------------------
//         */
//
//        // Process input parameter 'response'. HTTP response status codes from 200 to 299 indicate success.
//        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//            // locatedCat will have the initial values set as above
//            semaphore.signal()
//            return
//        }
//
//        // Process input parameter 'data'. Unwrap Optional 'data' if it has a value.
//        guard let jsonDataFromApi = data else {
//            // locatedCat will have the initial values set as above
//            semaphore.signal()
//            return
//        }
//
//        //------------------------------------------------
//        // JSON data is obtained from the API. Process it.
//        //------------------------------------------------
//        do {
//            /*
//             Foundation framework’s JSONSerialization class is used to convert JSON data
//             into Swift data types such as Dictionary, Array, String, Number, or Bool.
//             */
//            let jsonResponse = try JSONSerialization.jsonObject(with: jsonDataFromApi,
//                               options: JSONSerialization.ReadingOptions.mutableContainers)
//            /*
//             JSON object with Attribute-Value pairs corresponds to Swift Dictionary type with
//             Key-Value pairs. Therefore, we use a Dictionary to represent a JSON object
//             where Dictionary Key type is String and Value type is Any (instance of any type)
//             */
//            var catDataDictionary = Dictionary<String, Any>()   // Or [String: Any]()
//            if let jsonArray = jsonResponse as? [Any] {
//                // Iterate over the array
//                for aJsonObject in jsonArray {
//                    if let jsonObject = aJsonObject as? [String: Any] {
//                        catDataDictionary = jsonObject
//                    } else {
//                        // Return an empty response indicating that API access was unsuccessful
//                        return
//                    }
//                }   // End of 'for loop'
//            } else {
//                // Return an empty response indicating that API access was unsuccessful
//                return
//            }
//        
//            //------------------------
//            // Obtain Cats JSON Array
//            //------------------------
//           
//            var catsJsonArray = [Any]()
//            if let jArray = catDataDictionary["breeds"] as? [Any] {
//                catsJsonArray = jArray
//            } else {
//                semaphore.signal()
//                return
//            }
//               
//            //-------------------------
//            // Obtain Cats JSON Object
//            //-------------------------
//           
//            var catsJsonObject = [String: Any]()
//            if let jObject = catsJsonArray[0] as? [String: Any] {
//                catsJsonObject = jObject
//            } else {
//                semaphore.signal()
//                return
//            }
//          
//            //----------------
//            // Initializations
//            //----------------
//            
//            var catId = "", catName = "", catVetUrl = "", catTemp = "", catOrigin = ""
//            var catDesc = "", catSpan = "", catWeight = "", catUrl = ""
//            
//            //--------------------
//            // Obtain Name
//            //--------------------
//
//            // "name":"Germany"
//            if let nameOfCat = catsJsonObject["name"] as? String {
//                catName = nameOfCat
//            } else {
//                // locatedCat will have the initial values as set above
//                semaphore.signal()
//                return
//            }
//
//            //--------------------------
//            // Obtain id
//            //--------------------------
//
//            if let id = catsJsonObject["id"] as? String {
//                catId = id
//            } else {
//                catId = "unavailable"
//            }
//
//            //-------------------------
//            // Obtain veturl
//            //-------------------------
//
//            if let VetUrl = catsJsonObject["vetstreet_url"] as? String {
//                catVetUrl = VetUrl
//            } else {
//                catVetUrl = "unavailable"
//            }
//
//            //--------------------------
//            // Obtain temperament
//            //--------------------------
//
//            // "population":81770900
//            if let temp = catsJsonObject["temperament"] as? String {
//                catTemp = temp
//            } else {
//                catTemp = "unavailable"
//            }
//
//            //------------------------------
//            // Obtain Latitude and Longitude
//            //------------------------------
//
//            // "latlng":[51.0,9.0]
//            if let ori = catsJsonObject["origin"] as? String {
//                catOrigin = ori
//            } else {
//                catOrigin = "unavailable"
//            }
//
//            //-----------------------------------------------
//            // Obtain Cat Total Area in Square Kilometers
//            //-----------------------------------------------
//
//            // "area":357114.0
//            if let desc = catsJsonObject["description"] as? String {
//                catDesc = desc
//            } else {
//                catDesc = "unavailable"
//            }
//
//            //------------------------
//            // Obtain Cat Currency
//            //------------------------
//
//            // "currencies":[{"code":"EUR","name":"Euro","symbol":"€"}]
//            if let span = catsJsonObject["life_span"] as? String {
//                catSpan = span
//            } else {
//                catSpan = "unavailable"
//            }
//
//            //----------------------------------
//            // Obtain Cat Official Languages
//            //----------------------------------
//            
//            if let weightArray = catsJsonObject["weight"] as? [String: Any] {
//                if let weight = weightArray["imperial"] as? String {
//                    catWeight = weight
//                }
//            } else {
//                catWeight = "unavailable"
//            }
//            
//            //----------------------------------
//            // Obtain Cat Official Languages
//            //----------------------------------
//            
//            if let url = catDataDictionary["url"] as? String {
//                catUrl = url
//            } else {
//                catUrl = "unavailable"
//            }
//            
//            //----------------------------------------------------------
//            // Construct a New Cat Struct and Set it to locatedCat
//            //----------------------------------------------------------
//            
//            locatedCat = Cat(id: catId, name: catName, vetstreet_url: catVetUrl, temperament: catTemp, origin: catOrigin, description: catDesc, life_span: catSpan, weight: catWeight, url: catUrl)
//
//        } catch {
//            // locatedCat will have the initial values set as above
//            semaphore.signal()
//            return
//        }
//
//        semaphore.signal()
//    }).resume()
//
//    /*
//     The URLSession task above is set up. It begins in a suspended state.
//     The resume() method starts processing the task in an execution thread.
//
//     The semaphore.wait blocks the execution thread and starts waiting.
//     Upon completion of the task, the Completion Handler code is executed.
//     The waiting ends when .signal() fires or timeout period of 10 seconds expires.
//    */
//
//    _ = semaphore.wait(timeout: .now() + 10)
//
//}
//
