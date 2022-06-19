////
////  ContactDetails.swift
////  MyContacts
////
////  Created by Shashank datta Bezgam on 12/1/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import SwiftUI
//
//struct ContactDetails: View {
//    
//    // ❎ Input parameter: CoreData Contact Entity instance reference
//    let contact: Contact
//    
//    var body: some View {
//        Form {
//            /*
//            ?? is called nil coalescing operator.
//            IF contact.contactName is not nil THEN
//                unwrap it and return its value
//            ELSE return ""
//            */
//            Group {
//                Section(header: Text("Change This Contact's Attributes")) {
//                    NavigationLink(destination: ChangeContact(contact: contact)) {
//                        HStack {
//                            Image(systemName: "pencil.circle")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.light))
//                                .foregroundColor(.blue)
//                            Text("Change Contact")
//                        }
//                    }
//                }
//                Section(header: Text("Name")) {
//                    Text("\(contact.firstName ?? "") \(contact.lastName ?? "")")
//                }
//                Section(header: Text("Photo")) {
//                    // This public function is given in UtilityFunctions.swift
//                    getImageFromBinaryData(binaryData: contact.photo!.contactPhoto!, defaultFilename: "DefaultContactPhoto")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(minWidth: 300, maxWidth: 500, alignment: .center)
//                }
//                Section(header: Text("Company Name")) {
//                    Text(contact.company ?? "")
//                }
//                Section(header: Text("Phone Number")) {
//                    HStack
//                    {
//                        Image(systemName: "phone.circle")
//                            .imageScale(.medium)
//                            .font(Font.title.weight(.light))
//                            .foregroundColor(.blue)
//                        Text(contact.phone ?? "")
//                    }
//                }
//                Section(header: Text("Email Address")) {
//                    HStack
//                    {
//                        Image(systemName: "envelope")
//                            .imageScale(.medium)
//                            .font(Font.title.weight(.light))
//                            .foregroundColor(.blue)
//                        Text(contact.email ?? "")
//                    }
//                }
//            }
//            Group {
//                Section(header: Text("Website Url")) {
//                    if (contact.url!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
//                        NavigationLink(destination: invalidUrlMessage()) {
//                            HStack
//                            {
//                                Image(systemName: "globe")
//                                    .imageScale(.medium)
//                                    .font(Font.title.weight(.light))
//                                    .foregroundColor(.blue)
//                                Text("Show Contact's Website")
//                            }
//                            .foregroundColor(.blue)
//                        }
//                    }
//                    else {
//                        Link(destination: URL(string: contact.url ?? "")!) {
//                            HStack
//                            {
//                                Image(systemName: "globe")
//                                    .imageScale(.medium)
//                                    .font(Font.title.weight(.light))
//                                    .foregroundColor(.blue)
//                                Text("Show Contact's Website")
//                            }
//                            .foregroundColor(.blue)
//                        }
//                    }
//                }
//                Section(header: Text("Notes")) {
//                    Text(contact.notes ?? "")
//                }
//                Section(header: Text("Postal Address")) {
//                    Text(postalAddressView)
//                }
//            }
//        }   // End of Form
//        .navigationBarTitle(Text("Contact Details"), displayMode: .inline)
//        .font(.system(size: 14))
//    }   // End of body
//    
//    var postalAddressView: String {
//        var addressJoinString = ""
//        addressJoinString.append("\(contact.addressLine1 ?? "")\n")
//        if (!contact.addressLine2!.isEmpty)
//        {
//            addressJoinString.append("\(contact.addressLine2 ?? "")\n")
//        }
//
//        addressJoinString.append("\(contact.addressCity ?? ""), ")
//
//        if (!contact.addressState!.isEmpty)
//        {
//            addressJoinString.append("\(contact.addressState ?? "") ")
//        }
//        addressJoinString.append("\(contact.addressZipcode ?? "")\n\(contact.addressCountry ?? "")")
//        return addressJoinString
//    }
//}
//
//
//func invalidUrlMessage() -> AnyView {
//    return AnyView(ZStack {    // Color Background to Ivory color
//        Color(red: 1.0, green: 1.0, blue: 240/255).edgesIgnoringSafeArea(.all)
//
//        VStack {
//            Image(systemName: "exclamationmark.triangle")
//                .imageScale(.large)
//                .font(Font.title.weight(.medium))
//                .foregroundColor(.red)
//                .padding()
//            Text("Invalid URL Found!\nPlease change it to a valid URL!")
//                .fixedSize(horizontal: false, vertical: true)   // Allow lines to wrap around
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//        } // End of VStack
//    }) // End of ZStack
//}
