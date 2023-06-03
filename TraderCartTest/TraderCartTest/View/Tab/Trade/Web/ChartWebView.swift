//
//  ChartWebView.swift
//  TraderCartTest
//
//  Created by admin on 17/5/23.
//

import SwiftUI
import WebKit

struct ChartWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
        
    let webView: WKWebView
    
    init(webView: WKWebView) { self.webView = webView }
    
    func makeUIView(context: Context) -> WKWebView { webView }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}
