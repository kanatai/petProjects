//
//  HeaderView.swift
//  TestTraderProject
//
//  Created by admin on 22/5/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: proxy.size.width / 12) {
                TitleText(title: "№")
                    .font(Font.custom("Inter-Medium", size: 12))
                    .frame(alignment: .leading)
                
                TitleText(title: "Сountry")
                    .font(Font.custom("Inter-Medium", size: 12))
                    .offset(x: 0)
                    .frame(alignment: .leading)
                
                TitleText(title: "Name")
                    .font(Font.custom("Inter-Medium", size: 12))
                    .offset(x: -10)
                    .frame(alignment: .leading)
                
                TitleText(title: "Deposit")
                    .font(Font.custom("Inter-Medium", size: 12))
                    .offset(x: 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TitleText(title: "Profit")
                    .font(Font.custom("Inter-Medium", size: 12))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
        }
        .background(Color("cell_light_color"), ignoresSafeAreaEdges: .all)
        .frame(maxWidth: .infinity,
               maxHeight: 50,
               alignment: .leading)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewDevice("iPhone SE (3rd generation)")
        
        HeaderView()
            .previewDevice("iPhone 14 Pro")
        
        HeaderView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
