//
//  WebView.swift
//  wkwebview
//
//  Created by Brent Bumann on 5/28/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var html: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(html, baseURL: nil)
    }
}
