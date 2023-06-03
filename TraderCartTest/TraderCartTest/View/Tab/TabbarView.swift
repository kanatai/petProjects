//
//  TabbarView.swift
//  TraderCartTest
//
//  Created by admin on 16/5/23.
//

import SwiftUI

struct TabbarView: View {
    
    @State private var selectTabItem = "trade"
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "tabbar_bg_color")
        UITabBar.appearance().tintColor = UIColor(named: "green")
        UITabBar.appearance().barTintColor = UIColor(named: "tabbar_text_color")
    }
    
    var body: some View {
        TabView(selection: $selectTabItem) {
            TradeView().tag("trade")
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Trade")
                        .font(Font.custom("Inter-SemiBold", size: 10))
                        .foregroundColor(Color(""))
                }
            
            TopView(title: .constant("TOP 10 Traders")).tag("top")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Top")
                        .font(Font.custom("Inter-SemiBold", size: 10))
                }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                CustomTitleNV(title: .constant("Trade"))
            }
        }
        .accentColor(Color("green"))
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
