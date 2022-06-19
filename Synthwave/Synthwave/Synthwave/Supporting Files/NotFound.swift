//
//  NoTripsFound.swift
//  NoTripsFound
//
//  Created by cs3714 on 12/8/21.
//  Copyright © 2021 Team 9. All rights reserved.
//

import Foundation
import Firebase
import Combine
import SwiftUI
 
struct NotFound: View {
    var body: some View {
        ZStack {    // Color Background to Ivory color
//            Color(red: 1.0, green: 1.0, blue: 240/255)
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "exclamationmark.triangle")
                    .imageScale(.large)
                    .font(Font.title.weight(.medium))
                    .foregroundColor(.red)
                    .padding()
                Text("Trip Search Produced No Results!\n\nDatabase search did not return any value for the given query!")
                    .fixedSize(horizontal: false, vertical: true)   // Allow lines to wrap around
                    .multilineTextAlignment(.center)
                    .padding()
            } // End of VStack
        } // End of ZStack
    }
}

struct NotFound_Previews: PreviewProvider {
    static var previews: some View {
         NotFound()
    }
}
