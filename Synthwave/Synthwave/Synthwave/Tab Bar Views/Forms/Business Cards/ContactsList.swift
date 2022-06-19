////
////  ContactsList.swift
////  Contacts
////
////  Created by Shashank datta Bezgam on 12/1/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import SwiftUI
//import CoreData
//
//struct ContactsList: View {
//
//    // ❎ CoreData managedObjectContext reference
//    @Environment(\.managedObjectContext) var managedObjectContext
//
//    // ❎ CoreData FetchRequest returning all contact entities in the database
//    @FetchRequest(fetchRequest: Contact.allContactsFetchRequest()) var allContacts: FetchedResults<Contact>
//
//    var body: some View {
//        NavigationView {
//            List {
//                /*
//                 Each NSManagedObject has internally assigned unique ObjectIdentifier
//                 used by ForEach to display the contact in a dynamic scrollable list.
//                 */
//                ForEach(allContacts) { aContact in
//                    NavigationLink(destination: ContactDetails(contact: aContact)) {
//                        ContactItem(contact: aContact)
//                    }
//                }
//                .onDelete(perform: delete)
//
//            }   // End of List
//            .navigationBarTitle(Text("Contacts"), displayMode: .inline)
//
//            // Place the Edit button on left and Add (+) button on right of the navigation bar
//            .navigationBarItems(leading: EditButton(), trailing:
//                NavigationLink(destination: AddNewContact()) {
//                    Image(systemName: "plus")
//                })
//
//        }   // End of NavigationView
//            // Use single column navigation view for iPhone and iPad
//            .navigationViewStyle(StackNavigationViewStyle())
//    }
//
//    /*
//     ---------------------------------
//     MARK: Delete Selected  Contact
//     ---------------------------------
//     */
//    func delete(at offsets: IndexSet) {
//
//        let contactToDelete = allContacts[offsets.first!]
//
//        // ❎ CoreData Delete operation
//        managedObjectContext.delete(contactToDelete)
//
//        // ❎ CoreData Save operation
//        do {
//          try managedObjectContext.save()
//        } catch {
//          print("Unable to delete selected contact!")
//        }
//    }
//
//}
//
//struct ContactsList_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactsList()
//    }
//}
