//
//  FirebaseAuthTestApp.swift
//  FirebaseAuthTest
//
//  Created by Brent Bumann on 5/9/24.
//

import SwiftUI
import Firebase

@main
struct FirebaseAuthTestApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
