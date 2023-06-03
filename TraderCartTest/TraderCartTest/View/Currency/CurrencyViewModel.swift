//
//  CurrencyViewModel.swift
//  TraderCartTest
//
//  Created by admin on 19/5/23.
//

import Foundation

class CurrencyViewModel: ObservableObject {
    @Published var currency: CurrencyModel? = nil
    @Published var currencies: [CurrencyModel] = CurrencyModel.listCurrency
    
    let itemPerRow: CGFloat = 2
    let horizontalSpacing: CGFloat = 16
    let height: CGFloat = 54
    
    init(currency: CurrencyModel? = nil) {
        self.currency = currency
    }
}
