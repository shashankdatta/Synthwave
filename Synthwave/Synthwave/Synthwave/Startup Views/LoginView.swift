//
//  LoginView.swift
//  Photo Album
//
//  Created by Osman Balci on 7/30/21.
//  Copyright © 2021 Osman Balci. All rights reserved.
//

import SwiftUI


struct LoginView : View {
    @EnvironmentObject var session: SessionStore
    
    // State variables
    @Environment(\.colorScheme) var colorScheme
    @State private var enteredPassword = ""
    @State private var enteredEmail = ""
    @State private var showInvalidCredentialsAlert = false
    @State private var showSuccessfulSignUpAlert = false
    @State private var showNoBiometricCapabilityAlert = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.colorTop, .colorBottom]),  startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)

        // Foreground View
            ScrollView(.vertical, showsIndicators: false) {
                VStack {

                    Text("Login or Create New Account")
                        .font(Font.title2.weight(.bold))
                        .padding()
                        .padding(.top, 50)
                    
                    ProfilePhoto(filename: "NoLoginProfile", frameWidth: 150, frameHeight: 150)
                        .padding(.bottom, 40)

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
                        
                        HStack {
                            Spacer()
                            NavigationLink (destination: ResetPassword()) {
                                Text("Forgot Password?")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 13))
                                    .padding(.bottom, 35)
                                    .padding(.trailing, 140)
                            }
                            Spacer()
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            session.signIn(email: enteredEmail, password: enteredPassword) { (result, error) in
                                guard result != nil, error == nil else {
                                    showInvalidCredentialsAlert = true;
                                    return
                                }
                            }
                        }) {
                            Text("Login")
                                .frame(width: 120, height: 40, alignment: .center)
                                .background(
                                    Color.black
                                )
                                .cornerRadius(15)
                                .foregroundColor(Color.colorBottom)
                        }
                        .padding(.trailing, 5)
                        
                        
//                            Button(action: {
//                                    // Sigup for account instead
//                                session.signUp(email: enteredEmail, password: enteredPassword) { (result, error) in
//                                    guard result != nil, error == nil else {
//                                        showSuccessfulSignUpAlert = true
//                                        return
//                                    }
//                                }
//                            }) {
//                                Text("SignUp")
//                                    .frame(width: 120, height: 40, alignment: .center)
//                                    .background(
//                                        Color.black
//                                    )
//                                    .cornerRadius(15)
//                                    .foregroundColor(Color.colorTop)
//                            }
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign Up")
                                .frame(width: 120, height: 40, alignment: .center)
                                .background(
                                    Color.black
                                )
                                .cornerRadius(15)
                                .foregroundColor(Color.colorTop)
                        }
                        .padding(.trailing, 5)
                    }   // End of HStack
                    
                    /*
                     *********************************************************
                     *   Biometric Authentication with Face ID or Touch ID   *
                     *********************************************************
                     */
                    
    //                     Enable biometric authentication only if a password has already been set
    //                    if UserDefaults.standard.isLoggedIn() {
    //                        Button(action: {
    //                            // authenticateUser() is given in UserAuthentication
    //                            authenticateUser() { status in
    //                                switch (status) {
    //                                case .Success:
    //                                    canLogin = true
    //                                    print("case .Success")
    //                                case .Failure:
    //                                    canLogin = false
    //                                    print("case .Failure")
    //                                case .Unavailable:
    //                                    canLogin = false
    //                                    showNoBiometricCapabilityAlert = true
    //                                    print("case .Unavailable")
    //                                }
    //                            }
    //                        }) {
    //                            Text("Use Face ID or Touch ID")
    //                                .frame(width: 240, height: 36, alignment: .center)
    //                                .background(
    //                                    RoundedRectangle(cornerRadius: 16)
    //                                        .strokeBorder(Color.black, lineWidth: 1)
    //                                )
    //                        }
    //                        HStack {
    //                            Image(systemName: "faceid")
    //                                .font(.system(size: 40))
    //                                .padding()
    //                            Image(systemName: "touchid")
    //                                .font(.system(size: 40))
    //                                .padding()
    //                        }
    //                    }
                    }   // End of VStack
                    .alert(isPresented: $showInvalidCredentialsAlert, content: { invalidCredentialsAlert })
                    .alert(isPresented: $showSuccessfulSignUpAlert, content: { successfulSignUpAlert })
//                    .alert(isPresented: $showNoBiometricCapabilityAlert, content: { noBiometricCapabilityAlert })
                    .foregroundColor(.black)
                }   // End of ScrollView
        }   // End of ZStack
        .navigationBarHidden(true)
    }   // End of var
    
    //-----------------------
    // Invalid Password Alert
    //-----------------------
    var invalidCredentialsAlert: Alert {
        Alert(title: Text("Invalid Email/Password!"),
              message: Text("Please enter a valid email/password to unlock the app!"),
              dismissButton: .default(Text("OK")) )
        // Tapping OK resets showInvalidCredentialsAlert to false
    }
    
    //-------------------------
    // Successful Sign up Alert
    //-------------------------
    var successfulSignUpAlert: Alert {
        Alert(title: Text("Successfully Signed Up!"),
              message: Text("Congratulations, You have signed up successfully!"),
              dismissButton: .default(Text("OK")) )
        // Tapping OK resets showInvalidCredentialsAlert to false
    }
    
     //------------------------------
     // No Biometric Capability Alert
     //------------------------------
    var noBiometricCapabilityAlert: Alert{
        Alert(title: Text("Unable to Use Biometric Authentication!"),
              message: Text("Your device does not support biometric authentication!"),
              
              dismissButton: .default(Text("OK")) )
        // Tapping OK resets showNoBiometricCapabilityAlert to false
    }
    
    func checkDarkScheme() -> Bool {
        return colorScheme == .dark
    }
}
