//
//  WebView.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
        
    let webView: WKWebView
    
    init(webView: WKWebView) {
        self.webView = webView
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

