//
//  CustomStateMachine.swift
//  WebBrowser
//
//  Created by admin on 16/5/23.
//

import Foundation
import SwiftUI
import WebKit
import RealmSwift

class WBViewModel: ObservableObject {
    @ObservedResults(HistoryRealmModel.self) var histories
    @Published var openHistory: Bool = false
    @Published var urlString = ""
        
    let webView: WKWebView
    
    init() {
        webView = WKWebView(frame: .zero)
    }
    
    func loadUrl() {
        urlString = replaceDumain(url: urlString)
        guard let url = URL(string: urlString) else {
            return
        }
        webView.load(URLRequest(url: url))
        saveToHistory()
    }
    
    func back() {
        webView.goBack()
    }
    
    func forward() {
        webView.goForward()
    }
    
    func saveToHistory() {
        let newItem = HistoryRealmModel(name: urlString, created: convertDateToStr(date: Date()))
        $histories.append(newItem)
    }
    
    func convertDateToStr(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY.MM.dd HH:mm"
        let d = dateFormatter.string(from: date)
        return d
    }
    
    func replaceDumain(url: String) -> String {
        var result = url.lowercased()
        if result.starts(with: "www") {
            result = "https://\(result)"
        }
        return result
    }
}
