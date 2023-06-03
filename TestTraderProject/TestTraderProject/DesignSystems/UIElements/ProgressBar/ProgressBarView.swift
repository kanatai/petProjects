//
//  ProgressBarView.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var value: Float
    @Binding var procentValue: Float
    
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: proxy.size.width, height: 24)
                    .opacity(0.3)
                    .foregroundColor(Color("bg_progress"))
                
                Rectangle().frame(
                    width: min(CGFloat(self.value)*proxy.size.width,
                               proxy.size.width),
                    height: 24)
                .foregroundColor(Color("green"))
                .animation(.linear, value: true)
                .cornerRadius(45)
                
                HStack(alignment: .center) {
                    Text("\(Int(procentValue)) %")
                }
                .frame(width: proxy.size.width)
                .font(Font.custom("Inter-ExtraBold", size: 16))
                .foregroundStyle(Color.white)
            }
            .frame(height: 24)
            .cornerRadius(45)
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(value: .constant(0.2), procentValue: .constant(20))
            .previewDevice("iPhone SE (3rd generation)")

        ProgressBarView(value: .constant(0.2), procentValue: .constant(20))
            .previewDevice("iPhone 14 Pro")

        ProgressBarView(value: .constant(0.2), procentValue: .constant(20))
            .previewDevice("iPhone 14 Pro Max")
    }
}
