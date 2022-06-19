//
//  MenuView.swift
//  
//
//  Created by Shashank datta Bezgam on 6/6/22.
//

import Foundation
import SwiftUI
import Combine

struct MenuView: View {
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ProfilePhoto(filename: "NoLoginProfile", frameWidth: 120, frameHeight: 120)
                        .padding(.top, 40)
                        .padding(.bottom, 5)
                    
                    NavigationLink(destination: NotFound())
                    {
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .imageScale(.large)
                            Text("Profile")
                                .foregroundColor(.gray)
                                .font(.headline)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .imageScale(.large)
                        }
                    }
                    .padding(.top, 25)
                    
                    NavigationLink(destination: NotFound())
                    {
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                                .imageScale(.large)
                            Text("Messages")
                                .foregroundColor(.gray)
                                .font(.headline)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .imageScale(.large)
                        }
                    }
                    .padding(.top, 30)
                    
                    NavigationLink(destination: NotFound())
                    {
                        HStack {
                            Image(systemName: "gear")
                                .foregroundColor(.gray)
                                .imageScale(.large)
                            Text("Settings")
                                .foregroundColor(.gray)
                                .font(.headline)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .imageScale(.large)
                        }
                    }
                    .padding(.top, 30)
                    
                    Button(action: {
                       _ = session.signOut()
                    }) {
                        Text("Sign out")
                            .frame(width: 120, height: 40, alignment: .center)
                            .background(
                                Color.black
                            )
                            .cornerRadius(15)
                            .foregroundColor(Color.colorBottom)
                    }
                    .padding(.top, 30)
                    Spacer()
                .padding(.leading, 15)
            }
        }
        .padding()
        .accentColor(.orange)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

class MenuViewService: ObservableObject {
    @Published var isPresented = false
}
