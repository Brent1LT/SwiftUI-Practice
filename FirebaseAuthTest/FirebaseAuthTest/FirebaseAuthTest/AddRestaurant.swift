//
//  AddRestaurant.swift
//  FirebaseAuthTest
//
//  Created by Brent Bumann on 5/20/24.
//

import SwiftUI

struct AddRestaurant: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State var restaurant = ""
    @State var address = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Add a restaurant")
                .font(.title).bold()
            
            TextField("Restaurant Name", text: $restaurant)
                .padding(.horizontal, 16)
                .foregroundColor(Color(.black))
                .padding(.vertical, 16)
                .frame(width: 335, height: 52, alignment: .leading)
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            
            TextField("Restaurant Address", text: $address)
                .padding(.horizontal, 16)
                .foregroundColor(Color(.black))
                .padding(.vertical, 16)
                .frame(width: 335, height: 52, alignment: .leading)
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            
            GradientButton(text: "Submit")
                .onTapGesture {
                    firestoreManager.updateRestaurant(restaurantName: restaurant, restuarantAddress: address)
                }
        }
    }
}

#Preview {
    AddRestaurant().environmentObject(FirestoreManager())
}
