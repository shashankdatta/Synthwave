////
////  AddNewContact.swift
////  MyContacts
////
////  Created by Shashank datta Bezgam on 12/1/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import SwiftUI
//import CoreData
//
//struct AddNewContact: View {
//
//    // Enable this View to be dismissed to go back when the Save button is tapped
//    @Environment(\.presentationMode) var presentationMode
//
//    // ❎ CoreData managedObjectContext reference
//    @Environment(\.managedObjectContext) var managedObjectContext
//
//    @State private var showContactAddedAlert = false
//    @State private var showInputDataMissingAlert = false
//
//    // Contact Entity
//    @State private var firstName = ""
//    @State private var lastName = ""
//    @State private var company = ""
//    @State private var phone = ""
//    @State private var email = ""
//    @State private var url = ""
//    @State private var notes = ""
//    @State private var addressLine1 = ""
//    @State private var addressLine2 = ""
//    @State private var addressCity = ""
//    @State private var addressState = ""
//    @State private var addressZipcode = ""
//    @State private var addressCountry = ""
//
//    @State private var showImagePicker = false
//    @State private var photoImageData: Data? = nil
//    @State private var photoTakeOrPickIndex = 1     // Pick from Photo Library
//
//    var photoTakeOrPickChoices = ["Camera", "Photo Library"]
//
//    var body: some View {
//        Form {
//            Group {
//                Section(header: Text("First Name")) {
//                    HStack {
//                        TextField("Enter first name", text: $firstName)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        // Button to clear the text field
//                        Button(action: {
//                            firstName = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("Last Name")) {
//                    HStack {
//                        TextField("Enter last name", text: $lastName)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        // Button to clear the text field
//                        Button(action: {
//                            lastName = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("Company Name")) {
//                    HStack {
//                        TextField("Enter company name", text: $company)
//                        // Button to clear the text field
//                        Button(action: {
//                            company = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("Phone Number")) {
//                    HStack {
//                        TextField("Enter phone number", text: $phone)
//                        // Button to clear the text field
//                        Button(action: {
//                            phone = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("Email Address")) {
//                    HStack {
//                        TextField("Enter email address", text: $email)
//                        // Button to clear the text field
//                        Button(action: {
//                            email = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("Website Url")) {
//                    HStack {
//                        TextField("Enter website URL", text: $url)
//                        // Button to clear the text field
//                        Button(action: {
//                            url = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("Contact Notes"), footer:
//                    Button(action: {
//                        dismissKeyboard()
//                    }) {
//                        Image(systemName: "keyboard")
//                            .font(Font.title.weight(.light))
//                            .foregroundColor(.blue)
//                    }
//                ) {
//                    TextEditor(text: $notes)
//                        .frame(height: 100)
//                        .font(.custom("Helvetica", size: 14))
//                        .foregroundColor(.primary)
//                        .multilineTextAlignment(.leading)
//                }
//            }   // End of Group
//            .alert(isPresented: $showContactAddedAlert, content: {ContactAddedAlert})
//            Group {
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
//                Section(header: Text("Contact Photo")) {
//                    photoImage
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 100.0, height: 100.0)
//                }
//                Section(header: Text("Address Line 1")) {
//                    HStack {
//                        TextField("Enter address line 1", text: $addressLine1)
//                        // Button to clear the text field
//                        Button(action: {
//                            addressLine1 = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("Address Line 2")) {
//                    HStack {
//                        TextField("Enter address line 2", text: $addressLine2)
//                        // Button to clear the text field
//                        Button(action: {
//                            addressLine2 = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("City Name")) {
//                    HStack {
//                        TextField("Enter city name", text: $addressCity)
//                        // Button to clear the text field
//                        Button(action: {
//                            addressCity = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("State Abbreviation")) {
//                    HStack {
//                        TextField("Enter state abbreviation", text: $addressState)
//                        Button(action: {
//                            addressState = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("Zip Code")) {
//                    HStack {
//                        TextField("Enter zip code", text: $addressZipcode)
//                        // Button to clear the text field
//                        Button(action: {
//                            addressZipcode = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//                Section(header: Text("Country Name")) {
//                    HStack {
//                        TextField("Enter country name", text: $addressCountry)
//                        // Button to clear the text field
//                        Button(action: {
//                            addressCountry = ""
//                        }) {
//                            Image(systemName: "clear")
//                                .imageScale(.medium)
//                                .font(Font.title.weight(.regular))
//                        }
//                    }
//                }
//            }   // End of Group
//
//        }   // End of Form
//        .textFieldStyle(RoundedBorderTextFieldStyle())
//        .autocapitalization(.words)
//        .disableAutocorrection(true)
//        .font(.system(size: 14))
//        .alert(isPresented: $showInputDataMissingAlert, content: {inputDataMissingAlert})
//        .navigationBarTitle(Text("Add Contact"), displayMode: .inline)
//        .navigationBarItems(trailing:
//            Button(action: {
//                if inputDataValidated() {
//                    saveNewContact()
//                    showContactAddedAlert = true
//                } else {
//                    showInputDataMissingAlert = true
//                }
//            }) {
//                Text("Save")
//            })
//
//        .sheet(isPresented: $showImagePicker) {
//            /*
//             🔴 We pass $showImagePicker and $photoImageData with $ sign into PhotoCaptureView
//             so that PhotoCaptureView can change them. The @Binding keywork in PhotoCaptureView
//             indicates that the input parameter is passed by reference and is changeable (mutable).
//             */
//            PhotoCaptureView(showImagePicker: $showImagePicker,
//                             photoImageData: $photoImageData,
//                             cameraOrLibrary: photoTakeOrPickChoices[photoTakeOrPickIndex])
//        }
//
//    }   // End of body
//
//    var photoImage: Image {
//
//        if let imageData = photoImageData {
//            // The public function is given in UtilityFunctions.swift
//            let imageView = getImageFromBinaryData(binaryData: imageData, defaultFilename: "DefaultContactPhoto")
//            return imageView
//        } else {
//            return Image("DefaultContactPhoto")
//        }
//    }
//
//    /*
//     --------------------------
//     MARK: Contact Added Alert
//     --------------------------
//     */
//    var ContactAddedAlert: Alert {
//        Alert(title: Text("Contact Added!"),
//              message: Text("New contact is added to your Contacts list!"),
//              dismissButton: .default(Text("OK")) {
//                  // Dismiss this View and go back
//                  presentationMode.wrappedValue.dismiss()
//            })
//    }
//
//    /*
//     --------------------------------
//     MARK: Input Data Missing Alert
//     --------------------------------
//     */
//    var inputDataMissingAlert: Alert {
//        Alert(title: Text("Missing Input Data!"),
//              message: Text("Required Data: first name, last name, phone, email, address line 1, city, and country."),
//              dismissButton: .default(Text("OK")) )
//    }
//
//    func dismissKeyboard() {
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//
//    /*
//     -----------------------------
//     MARK: Input Data Validation
//     -----------------------------
//     */
//    func inputDataValidated() -> Bool {
//
//        if (firstName.isEmpty || lastName.isEmpty || phone.isEmpty || email.isEmpty ||
//            addressLine1.isEmpty || addressCity.isEmpty || addressCountry.isEmpty) {
//            return false
//        }
//
//        return true
//    }
//
//    /*
//     ----------------------
//     MARK: Save New Contact
//     ----------------------
//     */
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
//
//}
