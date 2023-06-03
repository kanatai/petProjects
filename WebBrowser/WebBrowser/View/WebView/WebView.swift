//
//  SwiftUIWebView.swift
//  WebBrowser
//
//  Created by admin on 18/5/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
        
    let webView: WKWebView
    var callback: ((String) -> ())
    
    init(webView: WKWebView, callback: @escaping ((String) -> ())) {
        self.webView = webView
        self.callback = callback
    }
    
    
    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self, callback: callback)
    }
    
    class WebViewCoordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var callback: ((String) -> ())
        
        init(_ parent: WebView, callback: @escaping ((String) -> ())) {
            self.parent = parent
            self.callback = callback
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let urlStr = navigationAction.request.url?.absoluteString {
                callback(urlStr)
            }
            decisionHandler(.allow)
        }
        
    }
}

//struct SwiftUIWebView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIWebView()
//    }
//}
