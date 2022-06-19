////
////  ChangeContact.swift
////  MyContacts
////
////  Created by Shashank datta Bezgam on 12/1/21.
////  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
////
//
//import SwiftUI
//import CoreData
//
//struct ChangeContact: View {
//
//    // ❎ Input parameter: Core Data Contact Entity instance reference
//    let contact: Contact
//
//    // Enable this View to be dismissed to go back when the Save button is tapped
//    @Environment(\.presentationMode) var presentationMode
//
//    // ❎ CoreData managedObjectContext reference
//    @Environment(\.managedObjectContext) var managedObjectContext
//
//    @State private var showChangesSavedAlert = false
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
//    // Contact Entity changeContacts
//    @State private var changeContactFirstName = false
//    @State private var changeContactLastName = false
//    @State private var changeContactCompany = false
//    @State private var changeContactPhone = false
//    @State private var changeContactEmail = false
//    @State private var changeContactUrl = false
//    @State private var changeContactNotes = false
//    @State private var changeContactAddressLine1 = false
//    @State private var changeContactAddressLine2 = false
//    @State private var changeContactAddressCity = false
//    @State private var changeContactAddressState = false
//    @State private var changeContactAddressZipcode = false
//    @State private var changeContactAddressCountry = false
//    @State private var changeContactPhoto = false
//
//    // Contact Cover Photo
//    @State private var showImagePicker = false
//    @State private var photoImageData: Data? = nil
//    @State private var photoTakeOrPickIndex = 1     // Take using gallery
//
//    var photoTakeOrPickChoices = ["Camera", "Photo Library"]
//
//    var body: some View {
//        Form {
//            Group {
//                Section(header: Text("First Name")) {
//                    firstNameSubview
//                }
//                Section(header: Text("Last Name")) {
//                    lastNameSubview
//                }
//                Section(header: Text("Company Name")) {
//                    companySubview
//                }
//                Section(header: Text("Phone Number")) {
//                    phoneSubview
//                }
//                Section(header: Text("Email Address")) {
//                    emailSubview
//                }
//                Section(header: Text("Website Url")) {
//                    webUrlSubview
//                }
//            }
//            Group {
//                Section(header: Text("Contact Notes")) {
//                    notesSubview
//                }
//
//                if changeContactNotes {
//                    Section(header: Text("New Contact Notes"), footer:
//                                Button(action: {
//                                    self.dismissKeyboard()
//                                }) {
//                                    Image(systemName: "keyboard")
//                                        .font(Font.title.weight(.light))
//                                        .foregroundColor(.blue)
//                                }
//                    ) {
//                        TextEditor(text: $notes)
//                            .frame(height: 100)
//                            .font(.custom("Helvetica", size: 14))
//                            .foregroundColor(.primary)
//                            .multilineTextAlignment(.leading)
//                    }
//                }
//                Section(header: Text("Contact Photo")) {
//                    contactPhotoSubview
//                }
//
//                if changeContactPhoto {
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
//                        Spacer()
//                        photoImage
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 100.0, height: 100.0)
//                    }   // End of VStack
//
//                }   // End of If statement
//            }
//            Group {
//                Section(header: Text("Address Line 1")) {
//                    addressLine1Subview
//                }
//                Section(header: Text("Address Line 2")) {
//                    addressLine2Subview
//                }
//                Section(header: Text("City Name")) {
//                    addressCitySubview
//                }
//                Section(header: Text("State Abbreviation")) {
//                    addressStateSubview
//                }
//                Section(header: Text("Zip Code")) {
//                    addressZipCodeSubview
//                }
//                Section(header: Text("Country Name")) {
//                    addressCountrySubview
//                }
//            }
//
//        }   // End of Form
//        .font(.system(size: 14))
//        .alert(isPresented: $showChangesSavedAlert, content: { changesSavedAlert })
//        .disableAutocorrection(true)
//        .autocapitalization(.words)
//        .navigationBarTitle(Text("Change Contact"), displayMode: .inline)
//        .navigationBarItems(trailing:
//            Button(action: {
//                if changesMade() {
//                    saveChanges()
//                }
//                // Show changes saved or no changes saved alert
//                showChangesSavedAlert = true
//            }) {
//                Text("Save")
//            })
//        .sheet(isPresented: $showImagePicker) {
//            PhotoCaptureView(showImagePicker: $showImagePicker,
//                             photoImageData: $photoImageData,
//                             cameraOrLibrary: photoTakeOrPickChoices[photoTakeOrPickIndex])
//        }
//
//    }   // End of body
//
//    var firstNameSubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.firstName ?? "")
//                    Button(action: {
//                        changeContactFirstName.toggle()
//                    }) {
//                        Image(systemName: changeContactFirstName ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactFirstName {
//                    TextField("Change first name", text: $firstName)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//            }
//        )
//    }
//
//    var lastNameSubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.lastName ?? "")
//                    Button(action: {
//                        changeContactLastName.toggle()
//                    }) {
//                        Image(systemName: changeContactLastName ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactLastName {
//                    TextField("Change last name", text: $lastName)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//            }
//        )
//    }
//
//    var companySubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.company ?? "")
//                    Button(action: {
//                        changeContactCompany.toggle()
//                    }) {
//                        Image(systemName: changeContactCompany ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactCompany {
//                    TextField("Change company name", text: $company)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//            }
//        )
//    }
//
//    var phoneSubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.phone ?? "")
//                    Button(action: {
//                        changeContactPhone.toggle()
//                    }) {
//                        Image(systemName: changeContactPhone ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactPhone {
//                    TextField("Change phone number", text: $phone)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//            }
//        )
//    }
//
//    var emailSubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.email ?? "")
//                    Button(action: {
//                        changeContactEmail.toggle()
//                    }) {
//                        Image(systemName: changeContactEmail ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactEmail {
//                    TextField("Change email address", text: $email)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                         .autocapitalization(.none)
//                }
//            }
//        )
//    }
//
//    var webUrlSubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.url ?? "")
//                    Button(action: {
//                        changeContactUrl.toggle()
//                    }) {
//                        Image(systemName: changeContactUrl ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactUrl {
//                    TextField("Change website url", text: $url)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                         .autocapitalization(.none)
//                }
//            }
//        )
//    }
//
//    var notesSubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.notes ?? "")
//                    Button(action: {
//                        changeContactNotes.toggle()
//                    }) {
//                        Image(systemName: changeContactNotes ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//            }
//        )
//    }
//
//    var addressLine1Subview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.addressLine1 ?? "")
//                    Button(action: {
//                        changeContactAddressLine1.toggle()
//                    }) {
//                        Image(systemName: changeContactAddressLine1 ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactAddressLine1 {
//                    TextField("Change address line 1", text: $addressLine1)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//            }
//        )
//    }
//
//    var addressLine2Subview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.addressLine2 ?? "")
//                    Button(action: {
//                        changeContactAddressLine2.toggle()
//                    }) {
//                        Image(systemName: changeContactAddressLine2 ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactAddressLine2 {
//                    TextField("Change address line 2", text: $addressLine2)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//            }
//        )
//    }
//
//
//    var addressStateSubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.addressState ?? "")
//                    Button(action: {
//                        changeContactAddressState.toggle()
//                    }) {
//                        Image(systemName: changeContactAddressState ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactAddressState {
//                    TextField("Change state abbreviation", text: $addressState)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//            }
//        )
//    }
//
//
//    var addressCitySubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.addressCity ?? "")
//                    Button(action: {
//                        changeContactAddressCity.toggle()
//                    }) {
//                        Image(systemName: changeContactAddressCity ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactAddressCity {
//                    TextField("Change city name", text: $addressCity)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//            }
//        )
//    }
//
//    var addressZipCodeSubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.addressZipcode ?? "")
//                    Button(action: {
//                        changeContactAddressZipcode.toggle()
//                    }) {
//                        Image(systemName: changeContactAddressZipcode ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactAddressZipcode {
//                    TextField("Change Zip Code", text: $addressZipcode)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//            }
//        )
//    }
//
//    var addressCountrySubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    Text(contact.addressCountry ?? "")
//                    Button(action: {
//                        changeContactAddressCountry.toggle()
//                    }) {
//                        Image(systemName: changeContactAddressCountry ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }
//                if changeContactAddressCountry {
//                    TextField("Change country name", text: $addressCountry)
//                         .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//            }
//        )
//    }
//
//    var contactPhotoSubview: some View {
//        return AnyView(
//            VStack {
//                HStack {
//                    // This public function is given in UtilityFunctions.swift
//                    getImageFromBinaryData(binaryData: contact.photo!.contactPhoto!, defaultFilename: "DefaultContactPhoto")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 100.0, height: 100.0)
//
//                    Button(action: {
//                        changeContactPhoto.toggle()
//                    }) {
//                        Image(systemName: changeContactPhoto ? "multiply.circle" : "pencil.circle")
//                            .imageScale(.large)
//                            .foregroundColor(.blue)
//                    }
//                }   // End of HStack
//            }   // End of VStack
//        )
//    }
//
//    var contactPhotoImage: Image {
//
//        if let imageData = photoImageData {
//            let imageView = // This public function is given in UtilityFunctions.swift
//                getImageFromBinaryData(binaryData: imageData, defaultFilename: "DefaultContactPhoto")
//            return imageView
//        } else {
//            return Image("DefaultContactPhoto")
//        }
//    }
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
//     -------------------
//     MARK: Alert Message
//     -------------------
//     */
//    var changesSavedAlert: Alert {
//
//        if changesMade() {
//            return Alert(title: Text("Changes Saved!"),
//              message: Text("Your changes have been successfully saved to the database."),
//              dismissButton: .default(Text("OK")) {
//                  presentationMode.wrappedValue.dismiss()
//                })
//        }
//
//        return Alert(title: Text("No Changes Saved!"),
//          message: Text("You did not make any changes!"),
//          dismissButton: .default(Text("OK")) {
//              presentationMode.wrappedValue.dismiss()
//            })
//    }
//
//    /*
//     -------------------------
//     MARK: Changes Made or Not
//     -------------------------
//     */
//    func changesMade() -> Bool {
//
//        if firstName.isEmpty && lastName.isEmpty && company.isEmpty && phone.isEmpty && email.isEmpty && url.isEmpty && notes.isEmpty && addressLine1.isEmpty && addressLine2.isEmpty && addressCity.isEmpty && addressState.isEmpty && addressZipcode.isEmpty && addressCountry.isEmpty && photoImageData == nil {
//            return false
//        }
//        return true
//    }
//
//    func dismissKeyboard() {
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//
//    /*
//     ------------------------
//     MARK: Save Contact Changes
//     ------------------------
//     */
//    func saveChanges() {
//        // Change Contact attributes if updated
//
//        if firstName != "" {
//            contact.firstName = firstName
//        }
//        if lastName != "" {
//            contact.lastName = lastName
//        }
//        if company != "" {
//            contact.company = company
//        }
//        if phone != "" {
//            contact.phone = phone
//        }
//        if email != "" {
//            contact.email = email
//        }
//        if url != "" {
//            contact.url = url
//        }
//        if notes != "" {
//            contact.notes = notes
//        }
//        if addressLine1 != "" {
//            contact.addressLine1 = addressLine1
//        }
//        if addressLine2 != "" {
//            contact.addressLine2 = addressLine2
//        }
//        if addressCity != "" {
//            contact.addressCity = addressCity
//        }
//        if addressState != "" {
//            contact.addressState = addressState
//        }
//        if addressZipcode != "" {
//            contact.addressZipcode = addressZipcode
//        }
//        if addressCountry != "" {
//            contact.addressCountry = addressCountry
//        }
//        if photoImageData != nil {
//            if let imageData = photoImageData {
//                contact.photo!.contactPhoto! = imageData
//            } else {
//                // Obtain the default image from Assets.xcassets as UIImage
//                let photoUIImage = UIImage(named: "DefaultContactPhoto")
//
//                // Convert photoUIImage to data of type Data (Binary Data) in JPEG format with 100% quality
//                let photoData = photoUIImage?.jpegData(compressionQuality: 1.0)
//
//                // Assign photoData to Core Data entity attribute of type Data (Binary Data)
//                contact.photo!.contactPhoto! = photoData!
//            }
//        }
//
//        /*
//         ==================================
//         Save Changes to Core Data Database
//         ==================================
//        */
//
//        // ❎ CoreData Save operation
//        do {
//            try managedObjectContext.save()
//        } catch {
//            return
//        }
//
//    }   // End of function
//}
//
