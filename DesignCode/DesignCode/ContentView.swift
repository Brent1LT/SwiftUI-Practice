//
//  ContentView.swift
//  DesignCode
//
//  Created by Brent Bumann on 4/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Explore")
                    .font(.largeTitle.weight(.bold))
                Text("\(Date().formatted(date: .complete, time: .omitted))")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(20)
            
            VStack(spacing: 60) {
                ForEach(cards) { card in
                    CardView(card: card)
                        .scrollTransition { content, phase in
                            content.scaleEffect(phase.isIdentity ? 1 : 0.8)
                                .rotationEffect(.degrees(phase.isIdentity ? 0 : -30))
                                .rotation3DEffect(.degrees(phase.isIdentity ? 0 : 60), axis: (x: -1, y: 1, z: 0))
                                .blur(radius: phase.isIdentity ? 0 : 10)
                                .offset(x: phase.isIdentity ? 0 : -200)
                                
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
