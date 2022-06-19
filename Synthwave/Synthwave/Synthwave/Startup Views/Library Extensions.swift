//
//  Library Extensions.swift
//  Synthwave
//
//  Created by cs3714 on 2/1/22.
//  Copyright © 2022 Shashank & Dev. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static let colorTop =  Color(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0)
    static let colorBottom = Color(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0)
}

extension UserDefaults {
    
    enum UserDefaultKeys: String {
        case login
    }
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultKeys.login.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        bool(forKey: UserDefaultKeys.login.rawValue)
    }
}
