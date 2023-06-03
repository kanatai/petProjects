//
//  ProgressBarView.swift
//  TraderCartTest
//
//  Created by admin on 16/5/23.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var value: Float
    @Binding var procentValue: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color("bg_progress"))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width),
                                  height: geometry.size.height)
                    .foregroundColor(Color("green"))
                    .animation(.linear)
                    .cornerRadius(100)
                
                HStack(alignment: .center) {
                    Text("\(Int(procentValue)) %")
                }
                .frame(width: geometry.size.width)
                .font(Font.custom("Inter-ExtraBold", size: 16))
                .foregroundStyle(Color.white)
                    
            }
            .cornerRadius(45)
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(value: .constant(0.2), procentValue: .constant(0.2))
    }
}
