//
//  SellBuyButtonView.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import SwiftUI

struct SellBuyButtonView: View {
    let title: String
    let color: Color
    let callback: (() -> ())
    
    init(title: String,
         color: Color,
         callback: @escaping () -> Void
    ) {
        self.title = title
        self.color = color
        self.callback = callback
    }
    
    var body: some View {
        Button {
            callback()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity,
                        minHeight: 54.0,
                        maxHeight: 54.0,
                        alignment: .leading)
                .foregroundColor(.white)
                .font(Font.custom("Inter-Medium", size: 24))
                .padding(.leading, 20)
                .background(color)
                .cornerRadius(12)
        }
    }
}

struct SellBuyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SellBuyButtonView(title: "Sell",color: Color("red")) {
            
        }
    }
}
