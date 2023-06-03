//
//  TopCellView.swift
//  TestTraderProject
//
//  Created by admin on 22/5/23.
//

import SwiftUI

struct TopCellView: View {
    @Binding var top: TopModel
    @Binding var tops: [TopModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { proxy in
                HStack(alignment: .center,
                       spacing: proxy.size.width / 12
                ) {
                    TitleText(title: "\(top.number)", size: 14)
                        .font(Font.custom("Inter-Medium", size: 12))
                        .frame(width: 20, alignment: .leading)
                    
                    Image(top.flag)
                        .offset(y: 0)
                        .frame(width: 30, height: 18, alignment: .leading)
                    
                    TitleText(title: "\(top.name)", size: 14)
                        .offset(x: 0)
                        .frame(width: 60, alignment: .leading)
                    
                    TitleText(title: "$\(Int(top.deposit))", size: 14)
                        .offset(x: -8)
                        .frame(width: 60, alignment: .leading)
                    
                    TitleText(title: "$\(Int(top.profit))", size: 14, fc: Color("green"))
                        .offset(x: -18)
                        .frame(width: 80, alignment: .leading)
                }
            }
        }
        .frame(alignment: .center)
        .padding(.vertical)
//        .background(Color("cell_light_color"), ignoresSafeAreaEdges: .all)
        
    }
}

struct TopCellView_Previews: PreviewProvider {
    static var previews: some View {
        TopCellView(top: .constant(TopModel.mockData[1]), tops: .constant(TopModel.mockData))
            .previewDevice("iPhone SE (3rd generation)")
        
        TopCellView(top: .constant(TopModel.mockData[1]), tops: .constant(TopModel.mockData))
            .previewDevice("iPhone 14 Pro")
        
        TopCellView(top: .constant(TopModel.mockData[1]), tops: .constant(TopModel.mockData))
            .previewDevice("iPhone 14 Pro Max")
    }
}

