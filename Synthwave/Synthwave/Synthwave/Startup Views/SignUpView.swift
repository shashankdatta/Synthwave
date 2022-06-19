//
//  LoginView.swift
//  Photo Album
//
//  Created by Osman Balci on 7/30/21.
//  Copyright © 2021 Osman Balci. All rights reserved.
//

import SwiftUI


struct SignUpView : View {
    @EnvironmentObject var session: SessionStore
    
    // State variables
    @Environment(\.colorScheme) var colorScheme
    //    // Enable this View to be dismissed to go back when the Save button is tapped
    @Environment(\.presentationMode) var presentationMode
    
    @State private var enteredPassword = ""
    @State private var enteredEmail = ""
    @State private var profileImageText = "NoLoginProfile" // Default Profile Photo
    
    @State private var showSuccessfulSignUpAlert = false
    @State private var showUnsuccessfulSignUpAlert = false
    
    @State private var showImagePicker = false
    @State private var photoImageData: Data? = nil
    @State private var photoTakeOrPickIndex = 1     // Pick from Photo Library

    var photoTakeOrPickChoices = ["Camera", "Photo Library"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.colorTop, .colorBottom]),  startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)

        // Foreground View
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Create New Account")
                        .font(Font.title2.weight(.bold))
                        .padding()
                        .padding(.top, 50)
                    
                    VStack {
                        Picker("Take or Pick Photo", selection: $photoTakeOrPickIndex) {
                            ForEach(0 ..< photoTakeOrPickChoices.count, id: \.self) {
                                Text(photoTakeOrPickChoices[$0])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()

                        Button(action: {
                            showImagePicker = true
                        }) {
                            ProfilePhoto(filename: profileImageText, frameWidth: 150, frameHeight: 150)
                                .padding(.bottom, 40)
                        }
                    }   // End of VStack
                    
                    if (checkDarkScheme()) {
                        TextField("Email Address", text: $enteredEmail)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .foregroundColor(Color.white)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 255, height: 36)
                                .padding(.bottom, 5)
                    } else {
                        TextField("Email Address", text: $enteredEmail)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 255, height: 36)
                                .padding(.bottom, 5)
                    }
                    
                    VStack {
                        if (checkDarkScheme()) {
                            SecureField("Password", text: $enteredPassword)
                                .autocapitalization(.none)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 255, height: 36)
                                .foregroundColor(Color.white)
                                .disableAutocorrection(true)
                                .padding(.top, 5)
                        } else {
                            SecureField("Password", text: $enteredPassword)
                                .autocapitalization(.none)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 255, height: 36)
                                .disableAutocorrection(true)
                                .padding(.top, 5)
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            if ((enteredEmail != ""
                                 && enteredEmail.contains("@"))
                                    && enteredPassword != "") {
                                session.signUp(email: enteredEmail, password: enteredPassword) { (result, error) in
                                    guard result != nil, error == nil else {
                                        showSuccessfulSignUpAlert = true
                                        return
                                    }
                                }
                            } else {
                                showUnsuccessfulSignUpAlert = true
                            }
                        }) {
                            Text("Sign Up")
                                .frame(width: 120, height: 40, alignment: .center)
                                .background(
                                    Color.black
                                )
                                .cornerRadius(15)
                                .foregroundColor(Color.colorBottom)
                        }
                        .padding(.top, 20)
                    }   // End of HStack
                }   // End of VStack
                .sheet(isPresented: $showImagePicker) {
                    /*
                     🔴 We pass $showImagePicker and $photoImageData with $ sign into PhotoCaptureView
                     so that PhotoCaptureView can change them. The @Binding keywork in PhotoCaptureView
                     indicates that the input parameter is passed by reference and is changeable (mutable).
                     */
                    PhotoCaptureView(showImagePicker: $showImagePicker,
                                     photoImageData: $photoImageData,
                                     cameraOrLibrary: photoTakeOrPickChoices[photoTakeOrPickIndex])
                }
                .alert(isPresented: $showSuccessfulSignUpAlert, content: { successfulSignUpAlert })
                .alert(isPresented: $showUnsuccessfulSignUpAlert, content: { unsuccessfulSignUpAlert })
                .foregroundColor(.black)
                }   // End of ScrollView
        }   // End of ZStack
        .navigationBarHidden(true)
    }   // End of var
    
    //-----------------------
    // Invalid Password Alert
    //-----------------------
    var unsuccessfulSignUpAlert: Alert {
        Alert(title: Text("Empty email or password field"),
              message: Text("Please fix these issues to meet our sign up requirements"),
              dismissButton: .default(Text("OK")) )
        // Tapping OK resets showInvalidCredentialsAlert to false
    }
    
    //-------------------------
    // Successful Sign up Alert
    //-------------------------
    var successfulSignUpAlert: Alert {
        Alert(title: Text("Successfully Signed Up!"),
              message: Text("Congratulations, You have signed up successfully!"),
              dismissButton: .default(Text("OK")){
                presentationMode.wrappedValue.dismiss()
        })
        // Tapping OK resets showInvalidCredentialsAlert to false
    }
    
    func checkDarkScheme() -> Bool {
        return colorScheme == .dark
    }
    
    var photoImage: Image {
        if let imageData = photoImageData {
            // The public function is given in UtilityFunctions.swift
            let imageView = getImageFromBinaryData(binaryData: imageData, defaultFilename: profileImageText)
            return imageView
        } else {
            return Image(profileImageText)
        }
    }
    
//    func photoImage(int: Int, str: String) -> some View {
//        return AnyView(
//            getImageFromUrl(url: str, defaultFilename: "ImageUnavailable")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(minWidth: 100, maxWidth: 500, alignment: .center)
//                .padding()
//        )
//    }
}
