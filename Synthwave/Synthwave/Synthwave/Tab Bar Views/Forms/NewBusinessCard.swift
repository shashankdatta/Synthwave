////
////  Business Cards.swift
////  Synthwave
////
////  Created by cs3714 on 1/22/22.
////  Copyright © 2022 Shashank & dev. All rights reserved.
////
//
//import SwiftUI
//import Foundation
//
//struct NewBusinessCard: View {
//
//    @State private var firstName = ""
//    @State private var lastName = ""
//    @State private var company = ""
//    @State private var phone = ""
//    @State private var email = ""
//    @State private var showImagePicker = false
//    @State private var photoImageData: Data? = nil
//    @State private var photoTakeOrPickIndex = 1     // Pick from Photo Library
//
//    var photoTakeOrPickChoices = ["Camera", "Photo Library"]
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("CAT BREED IDENTIFICATION CODE")) {
//                    Text("Test")
//                }
//                Section(header: Text("Add Contact Photo")) {
//                    VStack {
//                        Picker("Take or Pick Photo", selection: $photoTakeOrPickIndex) {
//                            ForEach(0 ..< photoTakeOrPickChoices.count, id: \.self) {
//                                Text(photoTakeOrPickChoices[$0])
//                            }
//                        }
//                        .pickerStyle(SegmentedPickerStyle())
//                        .padding()
//
//                        Button(action: {
//                            showImagePicker = true
//                        }) {
//                            Text("Get Photo")
//                                .padding()
//                        }
//                    }   // End of VStack
//                }
//                Section(header: Text("CAT BREED NAME")) {
//                    Text(cat.name)
//                }
//                Section(header: Text("CAT PHOTO")) {
//                    getImageFromUrl(url: cat.url, defaultFilename: "ImageUnavailable")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(minWidth: 300, maxWidth: 500, alignment: .center)
//                }
//                Section(header: Text("CAT BREED DESCRIPTION")) {
//                    Text(cat.description)
//                }
//                Section(header: Text("CAT BREED TEMPERAMENT")) {
//                    Text(cat.temperament)
//                }
//
//            }
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .autocapitalization(.words)
//            .disableAutocorrection(true)
//            .font(.system(size: 14))
//            .alert(isPresented: $showInputDataMissingAlert, content: {inputDataMissingAlert})
//            .navigationBarTitle(Text("Add Contact"), displayMode: .inline)
//            .navigationBarItems(trailing:
//                Button(action: {
//                    if inputDataValidated() {
//                        saveNewContact()
////                        showContactAddedAlert = true
//                    } else {
////                        showInputDataMissingAlert = true
//                    }
//                }) {
//                    Text("Save")
//                })
//
//            .sheet(isPresented: $showImagePicker) {
//                /*
//                 🔴 We pass $showImagePicker and $photoImageData with $ sign into PhotoCaptureView
//                 so that PhotoCaptureView can change them. The @Binding keywork in PhotoCaptureView
//                 indicates that the input parameter is passed by reference and is changeable (mutable).
//                 */
//                PhotoCaptureView(showImagePicker: $showImagePicker,
//                                 photoImageData: $photoImageData,
//                                 cameraOrLibrary: photoTakeOrPickChoices[photoTakeOrPickIndex])
//            }
//        }
//    }   // End of body
//
//        var photoImage: Image {
//
//            if let imageData = photoImageData {
//                // The public function is given in UtilityFunctions.swift
//                let imageView = getImageFromBinaryData(binaryData: imageData, defaultFilename: "DefaultContactPhoto")
//                return imageView
//            } else {
//                return Image("DefaultContactPhoto")
//            }
//        }
//
//        /*
//         --------------------------
//         MARK: Contact Added Alert
//         --------------------------
//         */
////        var ContactAddedAlert: Alert {
////            Alert(title: Text("Contact Added!"),
////                  message: Text("New contact is added to your Contacts list!"),
////                  dismissButton: .default(Text("OK")) {
////                      // Dismiss this View and go back
////                      presentationMode.wrappedValue.dismiss()
////                })
////        }
//
//        /*
//         --------------------------------
//         MARK: Input Data Missing Alert
//         --------------------------------
//         */
////        var inputDataMissingAlert: Alert {
////            Alert(title: Text("Missing Input Data!"),
////                  message: Text("Required Data: first name, last name, phone, email, address line 1, city, and country."),
////                  dismissButton: .default(Text("OK")) )
////        }
//
//        func dismissKeyboard() {
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//        }
//
//        /*
//         -----------------------------
//         MARK: Input Data Validation
//         -----------------------------
//         */
//        func inputDataValidated() -> Bool {
//
////            if (firstName.isEmpty || lastName.isEmpty || phone.isEmpty || email.isEmpty ||
////                addressLine1.isEmpty || addressCity.isEmpty || addressCountry.isEmpty) {
////                return false
////            }
//
//            return true
//        }
//
//        /*
//         ----------------------
//         MARK: Save New Contact
//         ----------------------
//         */
//    func saveNewContact() {
//        /*
//         ======================================================
//         Create an instance of the Contact Entity and dress it up
//         ======================================================
//        */
//
//        // ❎ Create an instance of the Profile entity in CoreData managedObjectContext
//        let newContact = Contact(context: managedObjectContext)
//
//        // ❎ Dress it up by specifying its attributes
//        newContact.firstName = firstName
//        newContact.lastName = lastName
//        newContact.company = company
//        newContact.phone = phone
//        newContact.email = email
//        newContact.url = url
//        newContact.notes = notes
//        newContact.addressLine1 = addressLine1
//        newContact.addressLine2 = addressLine2
//        newContact.addressCity = addressCity
//        newContact.addressState = addressState
//        newContact.addressZipcode = addressZipcode
//        newContact.addressCountry = addressCountry
//        /*
//         ======================================================
//         Create an instance of the Photo Entity and dress it up
//         ======================================================
//         */
//
//        // ❎ Create an instance of the Photo Entity in CoreData managedObjectContext
//        let newPhoto = Photo(context: managedObjectContext)
//
//        // Obtain the contact photo image from Assets.xcassets as UIImage
//        var photoUIImage = UIImage(named: "DefaultContactPhoto")
//        if (photoImageData != nil) {
//           photoUIImage = UIImage(data: photoImageData!)
//        }
//
//        // Convert photoUIImage to data of type Data (Binary Data) in JPEG format with 100% quality
//        let photoData = photoUIImage?.jpegData(compressionQuality: 1.0)
//
//        // Assign photoData to Core Data entity attribute of type Data (Binary Data)
//        newPhoto.contactPhoto = photoData!
//
//        /*
//         ==============================
//         Establish Entity Relationships
//         ==============================
//        */
//
//        // ❎ Establish One-to-One relationship between Contact and Photo
//        newContact.photo = newPhoto      // An contact can have only one photo
//        newPhoto.contact = newContact      // A photo can belong to only one contact
//
//        /*
//         ===========================================
//         MARK: ❎ Save Changes to Core Data Database
//         ===========================================
//         */
//
//        do {
//            try managedObjectContext.save()
//        } catch {
//            return
//        }
//
//    }   // End of function
//}
