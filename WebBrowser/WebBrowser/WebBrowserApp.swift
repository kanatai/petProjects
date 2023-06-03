//
//  WebBrowserApp.swift
//  WebBrowser
//
//  Created by admin on 16/5/23.
//

import SwiftUI

@main
struct WebBrowserApp: App {
    
    @StateObject var model = WBViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
