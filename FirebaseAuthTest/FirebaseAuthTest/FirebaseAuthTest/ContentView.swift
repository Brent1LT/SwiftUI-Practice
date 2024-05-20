//
//  ContentView.swift
//  FirebaseAuthTest
//
//  Created by Brent Bumann on 5/9/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Text("My Restaurant: \(firestoreManager.restaurant)")
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: { login()}) {
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
    ContentView().environmentObject(FirestoreManager())
}
