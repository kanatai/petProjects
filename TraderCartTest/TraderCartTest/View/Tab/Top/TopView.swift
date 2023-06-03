//
//  TopView.swift
//  TraderCartTest
//
//  Created by admin on 17/5/23.
//

import SwiftUI

struct TopView: View {
    @State private var tops: [TopModel] = TopModel.mockData
    @Binding var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical) {
                HeaderView()
                ForEach($tops) { top in
                    TopCellView(top: top, tops: $tops)
                }
            }
            .padding(.horizontal, 12)
            .listStyle(.insetGrouped)
            .background(Color.clear)
            .scrollContentBackground(.hidden)
        }
        .preferredColorScheme(.light)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 20)
        .background(Color("bg_second_color"),
                    ignoresSafeAreaEdges: .all)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                CustomTitleNV(title: $title)
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: proxy.size.width / 17) {
                TitleText(title: "№")
                    .frame(maxWidth: 20, alignment: .leading)
                
                TitleText(title: "Сountry")
                    .padding(.leading, -10)
                    .frame(maxWidth: 60, alignment: .leading)
                
                TitleText(title: "Name")
                    .padding(.leading, -10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TitleText(title: "Deposit")
                    .padding(.leading, -16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TitleText(title: "Profit")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.vertical)
        .padding(.leading, 12)
        .frame(maxWidth: .infinity,
               maxHeight: 50,
               alignment: .leading)
        .background {
            CustomCorners(corners: [.topLeft, .topRight], radius: 12)
                .fill(Color("cell_light_color"))
        }
    }
}

struct TopCellView: View {
    @Binding var top: TopModel
    @Binding var tops: [TopModel]
    
    var body: some View {
        GeometryReader{ proxy in
            HStack(alignment: .center,
                   spacing: proxy.size.width / 14
            ) {
                TitleText(title: "\(top.number)",
                          size: 14)
                    .frame(maxWidth: 20, alignment: .leading)
                
                Image(top.flag)
                    .padding(.leading, -10)
                    .frame(width: 26, height: 26, alignment: .leading)
                
                TitleText(title: "\(top.name)",
                          size: 14)
                    .padding(.leading, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TitleText(title: "$\(Int(top.deposit))",
                          size: 14)
                    .padding(.leading, -4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TitleText(title: "$\(Int(top.profit))",
                          size: 14,
                          fc: Color("green"))
                    .padding(.trailing, 8)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: 50,
               alignment: .leading)
        .padding(.vertical)
        .padding(.leading, 12)
        .background {
            if let id = tops.last?.id, id == top.id {
                CustomCorners(corners: [.bottomLeft, .bottomRight], radius: 12)
                    .fill(Color("cell_light_color"))
            }
        }
    }
}

struct TitleText: View {
        
    @Binding var title: String
    private var size: CGFloat = 12.0
    private var foregroundColor: Color = Color("text_color")
    
    init(title: String,
         size: CGFloat = 12,
         fc: Color = Color("text_color")
    ) {
        _title = .constant(title)
        self.size = size
        foregroundColor = fc
    }
    
    var body: some View {
        Text(title)
            .foregroundColor(foregroundColor)
            .font(Font.custom("Inter-Medium", size: size))
    }
}

//struct TopView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopView()
//    }
//}
