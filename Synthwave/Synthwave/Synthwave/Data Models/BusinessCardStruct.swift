//
//  CatsStruct.swift
//  CatsStruct
//
//  Created by Shashank datta Bezgam on 9/28/21.
//  Copyright © 2021 Shashank datta Bezgam. All rights reserved.
//

import SwiftUI

struct BusinessCard: Hashable, Codable, Identifiable {

    var id: UUID
    var name: String
    var vetstreet_url: String
    var temperament: String
    var origin: String
    var description: String
    var life_span: String
    var weight: String
    var url: String
}
