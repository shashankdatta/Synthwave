//
//  ResetPassword.swift
//  Photo Album
//
//  Created by Osman Balci on 7/30/21.
//  Copyright © 2021 Osman Balci. All rights reserved.
//

import SwiftUI

struct ResetPassword: View {
    
    @EnvironmentObject var accountController: AccountController
    @Environment(\.presentationMode) var presentationMode
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    @State private var showEnteredValues = false
    @State private var emailAddressField = ""
    @State private var emailEntered = ""
    
    var body: some View {
        
//        Form {
//            Section(header: Text("Email Address")) {
//
//            }
//
//        }   // End of Form
        
        ZStack {
            Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        TextField("Enter Email Address", text: $emailEntered
//                            onCommit: {
//                                // Record entered value after Return key is pressed
//                                emailAddressField = emailEntered
//                            }
                        )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 260, height: 36)
                        .padding(.top, 5)
                        
                        Button(action: {
//                            emailAddressField = ""
                            emailEntered = ""
                        }) {
                            Image(systemName: "clear")
                                .imageScale(.medium)
                                .font(Font.title.weight(.regular))
                                .foregroundColor(Color.colorBottom)
                        }
                    }
                    .padding()
                    
                    Divider()
                    Button(action: {
                        if (emailAddressField != "") {
                            accountController.resetPassword(email: emailEntered)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        HStack {
                            Text("Send")
                                .frame(width: 150, height: 50, alignment: .center)
                                .background(
    //                                    RoundedRectangle(cornerRadius: 15)
    //                                        .strokeBorder(Color.black,)
                                    Color.colorTop
                                )
                                .cornerRadius(15)
                                .foregroundColor(Color.black)
                        }                    }
//                    .padding(.bottom, 0)
                }
//                .padding(.top, 10)
                .frame(width: 390, height: 200, alignment: .center)
                .background(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .strokeBorder(Color.black,)
                    Color.black
                )
                .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(LinearGradient(gradient: Gradient(colors: [.colorTop, .colorBottom]),  startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 5)
                    )
            }
        }
        // Set font and size for the whole Form content
        .font(.system(size: 14))
//        .navigationBarHidden(true)
        .foregroundColor(Color.white)
//        .background(LinearGradient(gradient: Gradient(colors: [.colorTop, .colorBottom]),  startPoint: .topLeading, endPoint: .bottomTrailing)
//                        .ignoresSafeArea(.all))
        .navigationBarTitle(Text("Password Reset"), displayMode: .inline)
    }   // End of var
}
