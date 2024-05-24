//
//  Animal.swift
//  data_from_json
//
//  Created by Brent Bumann on 5/23/24.
//

import Foundation

struct Animal: Identifiable, Decodable {
    var id: Int
    var name: String
    var age: Int
    var type: String
}
