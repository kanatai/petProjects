//
//  RowView.swift
//  TestTraderProject
//
//  Created by admin on 22/5/23.
//

import SwiftUI

struct RowView: View {
    let currencies: [CurrencyModel]
    let currency: CurrencyModel
    let width: CGFloat
    let height: CGFloat
    let horizontalSpacing: CGFloat
    let callback: ((CurrencyModel) -> ())
    
    init(currencies: [CurrencyModel] = [],
         currency: CurrencyModel,
         width: CGFloat,
         height: CGFloat,
         horizontalSpacing: CGFloat,
         callback: @escaping (CurrencyModel) -> Void
    ) {
        self.currencies = currencies
        self.currency = currency
        self.width = width
        self.height = height
        self.horizontalSpacing = horizontalSpacing
        self.callback = callback
    }
    
    var body: some View {
        HStack(spacing: horizontalSpacing) {
            ForEach(currencies, id: \.id) { item in
                CurrencyItemView(item: item,
                                 currentCurrency: currency,
                                 callback: callback)
                .frame(width: width,
                       height: height)
            }
        }
        .padding(.vertical, 5)
    }
}

