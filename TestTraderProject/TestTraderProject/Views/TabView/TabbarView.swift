//
//  TabView.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectTabItem = "trade"
    
    init() {
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(named: "tabbar_bg_color")
            appearance.selectionIndicatorTintColor = UIColor(named: "green")
            UITabBar.appearance().standardAppearance = appearance
//            UITabBar.appearance().scrollEdgeAppearance =  UITabBar.appearance().standardAppearance
        }
        
    }
    
    var body: some View {
        TabView(selection: $selectTabItem) {
            TradeView()
                .tag("trade")
                .tabItem {
                    Image("chart")
                        .renderingMode(.template)
                    Text("Trade")
                        .font(Font.custom("Inter-SemiBold", size: 10))
                }
            
            TopView()
                .tag("top")
                .tabItem {
                    Image("profile")
                        .renderingMode(.template)
                    Text("Top")
                        .font(Font.custom("Inter-SemiBold", size: 10))
                }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .accentColor(Color("green"))
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
