//
//  ContentView.swift
//  wkwebview
//
//  Created by Brent Bumann on 5/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var htmlContent = ""
    
    var body: some View {
        WebView(html: htmlContent)
            .onAppear {
                htmlContent = ParseContent().parse()
            }
    }
}

#Preview {
    ContentView()
}
