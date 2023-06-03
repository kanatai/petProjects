//
//  PropertyWrapperApp.swift
//  PropertyWrapper
//
//  Created by admin on 3/3/23.
//

import SwiftUI

@main
struct PropertyWrapperApp: App {
    
    @StateObject var counter = Counter()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(counter)
        }
    }
}
