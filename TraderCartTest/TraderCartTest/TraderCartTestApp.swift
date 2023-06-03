//
//  TraderCartTestApp.swift
//  TraderCartTest
//
//  Created by admin on 16/5/23.
//

import SwiftUI

@main
struct TraderCartTestApp: App {
    
    @StateObject var viewModel: LoadingViewModel = LoadingViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoadingView()
                    .environmentObject(viewModel)
            }
        }
    }
}
