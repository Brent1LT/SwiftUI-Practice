//
//  data_from_jsonApp.swift
//  data_from_json
//
//  Created by Brent Bumann on 5/23/24.
//

import SwiftUI

@main
struct data_from_jsonApp: App {
    var body: some Scene {
        let network = Network()
        
        WindowGroup {
            ContentView().environmentObject(network)
        }
    }
}
