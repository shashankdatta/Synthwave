////
////  ContactItem.swift
////  MyContacts
////
////  Created by Shashank datta Bezgam on 12/1/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import SwiftUI
//
//struct ContactItem: View {
//    
//    // ❎ Input parameter: CoreData Contact Entity instance reference
//    let contact: Contact
//    
//    var body: some View {
//        HStack {
//            // This public function is given in UtilityFunctions.swift
//            getImageFromBinaryData(binaryData: contact.photo!.contactPhoto!, defaultFilename: "DefaultContactPhoto")
//                .resizable()
//                .frame(width: 80, height: 80)
//                .clipShape(Circle())
//                .overlay(
//                    Circle().stroke(Color.white, lineWidth: 1))
//                .shadow(radius: 5)
//            
//            VStack(alignment: .leading) {
//                /*
//                ?? is called nil coalescing operator.
//                IF contact.artistName is not nil THEN
//                    unwrap it and return its value
//                ELSE return ""
//                */
//                Text("\(contact.firstName ?? "") \(contact.lastName ?? "")")
//                HStack
//                {
//                    Image(systemName: "phone.circle")
//                        .imageScale(.small)
//                        .font(Font.title.weight(.thin))
//                    Text(contact.phone ?? "")
//                }
//                HStack
//                {
//                    Image(systemName: "envelope")
//                        .imageScale(.small)
//                        .font(Font.title.weight(.thin))
//                    Text(contact.email ?? "")
//                }
//            }
//            .font(.system(size: 14))
//        }
//    }
//}
//
