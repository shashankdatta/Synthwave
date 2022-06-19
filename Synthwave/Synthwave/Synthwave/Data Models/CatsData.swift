////
////  CatsData.swift
////  CatsData
////
////  Created by Shashank datta Bezgam on 9/28/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import SwiftUI
//import Foundation
//
//// Global array of Cat structs
//var catsStructList = [Cat]()
//
///*
// Each orderedSearchableCatsList element contains
// selected cat attributes separated by vertical lines.
// */
//var orderedSearchableCatsList = [String]()
//
///*
// Global flag to track changes to catStructList.
// If changes are made, catStructList will be written to document directory
// in CatsApp when the app life cycle state changes.
// */
//var dataChanged = false
//
///*
// *******************************
// MARK: Read Cats Data Files
// *******************************
// */
//public func readCatsDataFiles() {
//    
//    var documentDirectoryHasFiles = false
//    let catsDataFullFilename = "CatsData.json"
//    
//    // Obtain URL of the CatsData.json file in document directory on the user's device
//    // Global constant documentDirectory is defined in UtilityFunctions.swift
//    let urlOfJsonFileInDocumentDirectory = documentDirectory.appendingPathComponent(catsDataFullFilename)
//
//    do {
//        /*
//         Try to get the contents of the file. The left hand side is
//         suppressed by using '_' since we do not use it at this time.
//         Our purpose is just to check to see if the file is there or not.
//         */
//
//        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
//        
//        /*
//         If 'try' is successful, it means that the CatsData.json
//         file exists in document directory on the user's device.
//         ---
//         If 'try' is unsuccessful, it throws an exception and
//         executes the code under 'catch' below.
//         */
//        
//        documentDirectoryHasFiles = true
//        
//        /*
//         --------------------------------------------------
//         |   The app is being launched after first time   |
//         --------------------------------------------------
//         The CatsData.json file exists in document directory on the user's device.
//         Load it from Document Directory into catStructList.
//         */
//        
//        // The function is given in UtilityFunctions.swift
//        catsStructList = decodeJsonFileIntoArrayOfStructs(fullFilename: catsDataFullFilename, fileLocation: "Document Directory")
//        print("CatsData is loaded from document directory")
//        
//    } catch {
//        documentDirectoryHasFiles = false
//        
//        /*
//         ----------------------------------------------------
//         |   The app is being launched for the first time   |
//         ----------------------------------------------------
//         The CatsData.json file does not exist in document directory on the user's device.
//         Load it from main bundle (project folder) into catStructList.
//         
//         This catch section will be executed only once when the app is launched for the first time
//         since we write and read the files in document directory on the user's device after first use.
//         */
//        
//        // The function is given in UtilityFunctions.swift
//        catsStructList = decodeJsonFileIntoArrayOfStructs(fullFilename: catsDataFullFilename, fileLocation: "Main Bundle")
//        print("CatsData is loaded from main bundle")
//        
//        /*
//         -------------------------------------------------------------
//         |   Create global variable orderedSearchableCatsList   |
//         -------------------------------------------------------------
//         This list has two purposes:
//         
//            (1) preserve the order of cats according to user's liking, and
//            (2) enable search of selected cat attributes by the SearchBar in FavoritesList.
//         
//         Each list element consists of "id|name|alpha2code|capital|languages|currency".
//         We chose these attributes separated by vertical lines to be included in the search.
//         We separate them with "|" so that we can extract its components separately.
//         For example, to obtain the id: list item.components(separatedBy: "|")[0]
//         */
//        for cat in catsStructList {
//            let selectedCatAttributesForSearch = "\(cat.name)"
//            
//            orderedSearchableCatsList.append(selectedCatAttributesForSearch)
//        }
//        
//    }   // End of do-catch
//    
//    /*
//    ----------------------------------------
//    Read OrderedSearchableCatsList File
//    ----------------------------------------
//    */
//    if documentDirectoryHasFiles {
//        // Obtain URL of the file in document directory on the user's device
//        let urlOfFileInDocDir = documentDirectory.appendingPathComponent("OrderedSearchableCatsList")
//        
//        // Instantiate an NSArray object and initialize it with the contents of the file
//        let arrayFromFile: NSArray? = NSArray(contentsOf: urlOfFileInDocDir)
//        
//        if let arrayObtained = arrayFromFile {
//            // Store the unique id of the created array into the global variable
//            orderedSearchableCatsList = arrayObtained as! [String]
//        } else {
//            print("OrderedSearchableCatsList file is not found in document directory on the user's device!")
//        }
//    }
//}
//
///*
// ******************************************************
// MARK: Write Cats Data Files to Document Directory
// ******************************************************
// */
//public func writeCatsDataFiles() {
//    /*
//    --------------------------------------------------------------------------
//    Write catStructList into CatsData.json file in Document Directory
//    --------------------------------------------------------------------------
//    */
//    
//    // Obtain URL of the JSON file into which data will be written
//    let urlOfJsonFileInDocumentDirectory: URL? = documentDirectory.appendingPathComponent("CatsData.json")
//
//    // Encode catStructList into JSON and write it into the JSON file
//    let encoder = JSONEncoder()
//    if let encoded = try? encoder.encode(catsStructList) {
//        do {
//            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
//        } catch {
//            fatalError("Unable to write encoded cats data to document directory!")
//        }
//    } else {
//        fatalError("Unable to encode cats data!")
//    }
//    
//    /*
//    ------------------------------------------------------
//    Write orderedSearchableCatsList into a file named
//    OrderedSearchableCatsList in Document Directory
//    ------------------------------------------------------
//    */
//
//    // Obtain URL of the file in document directory on the user's device
//    let urlOfFileInDocDirectory = documentDirectory.appendingPathComponent("OrderedSearchableCatsList")
//
//    /*
//    Swift Array does not yet provide the 'write' function, but NSArray does.
//    Therefore, typecast the Swift array as NSArray so that we can write it.
//    */
//    
//    (orderedSearchableCatsList as NSArray).write(to: urlOfFileInDocDirectory, atomically: true)
//    
//    /*
//     The flag "atomically" specifies whether the file should be written atomically or not.
//     
//     If flag atomically is TRUE, the file is first written to an auxiliary file, and
//     then the auxiliary file is renamed as OrderedSearchableCatsList.
//     
//     If flag atomically is FALSE, the file is written directly to OrderedSearchableCatsList.
//     This is a bad idea since the file can be corrupted if the system crashes during writing.
//     
//     The TRUE option guarantees that the file will not be corrupted even if the system crashes during writing.
//     */
//}
