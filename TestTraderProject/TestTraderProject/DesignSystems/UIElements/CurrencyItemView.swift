//
//  ItemView.swift
//  TestTraderProject
//
//  Created by admin on 22/5/23.
//

import SwiftUI

struct CurrencyItemView: View {
    let item: CurrencyModel
    let currentCurrency: CurrencyModel
    let callback: ((CurrencyModel) -> ())
    
    init(item: CurrencyModel,
         currentCurrency: CurrencyModel,
         callback: @escaping (CurrencyModel) -> Void
    ) {
        self.item = item
        self.currentCurrency = currentCurrency
        self.callback = callback
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text(item.title)
                .font(Font.custom("SFProText-Semibold", size: 14))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 54.0)
        .background(item.id == currentCurrency.id ? Color("green") : Color("secondary_bg_color"))
        .cornerRadius(12)
        .onTapGesture {
            callback(item)
        }
    }
}

