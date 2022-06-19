//
//  ProfilePhoto.swift
//  ProfilePhoto
//
//  Created by Shashank datta Bezgam on 8/30/21.
//  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
//

import SwiftUI

//  View constructed as a structure in a separate file
struct ProfilePhoto: View {
    // Input Parameter
    let filename: String
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    
    //  Used as ProfilePhoto(filename: "filename without file extension")
    
    var body: some View {
        /*
         Profile photo file with the given filename must be present in
         Assets.xcassets. The filename must exclude file extension.
         */
        
        Image(filename)
            .resizable()
            .frame(width: frameWidth, height: frameHeight)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 3))
            .shadow(radius: 5)
            .padding()
    }
}

