//
//  ContentView.swift
//  data_from_json
//
//  Created by Brent Bumann on 5/23/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    var body: some View {
//        VStack {
//            ForEach(animals) { animal in
//                Text("\(animal.name) is a \(animal.type)")
//            }
//        }
//        .padding()
        ScrollView {
            Text("All users")
                .font(.title).bold()
            
            VStack(alignment: .leading) {
                ForEach(network.users) { user in
                    HStack(alignment: .top) {
                        Text("\(user.id)")
                        
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .bold()
                            
                            Text(user.email.lowercased())
                            
                            Text(user.phone)
                        }
                    }
                    .frame(width: 300, alignment: .leading)
                    .padding()
                    .background(Color(.lightGray))
                    .cornerRadius(20)
                }
            }
        }
        .onAppear {
            network.getUsers()
        }
    }
}

#Preview {
    ContentView().environmentObject(Network())
}
