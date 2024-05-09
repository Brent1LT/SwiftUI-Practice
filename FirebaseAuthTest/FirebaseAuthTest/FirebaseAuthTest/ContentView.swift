//
//  ContentView.swift
//  FirebaseAuthTest
//
//  Created by Brent Bumann on 5/9/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: { }) {
                Text("Sign in")
            }
        }
        .padding()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (res, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success!")
            }
        }
    }
}

#Preview {
    ContentView()
}
