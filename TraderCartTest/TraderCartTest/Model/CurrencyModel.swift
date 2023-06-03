//
//  CurrencyModel.swift
//  TraderCartTest
//
//  Created by admin on 19/5/23.
//

import Foundation

struct CurrencyModel {
    var id: Int
    var title: String
    var url: String
}

extension CurrencyModel {
    
    static var listCurrency = [
        CurrencyModel(id: 1, title: "EUR / USD", url: "https://www.tradingview.com/chart/sN7EvZ2z/?symbol=FX_IDC%3AEURUSD"),
        CurrencyModel(id: 2, title: "GBP / USD", url: "https://www.tradingview.com/chart/sN7EvZ2z/?symbol=FX%3AGBPUSD"),
        CurrencyModel(id: 3, title: "USD / JPY", url: "https://www.tradingview.com/chart/sN7EvZ2z/?symbol=FX%3AUSDJPY"),
        CurrencyModel(id: 4, title: "AUD / USD", url: "https://www.tradingview.com/chart/sN7EvZ2z/?symbol=FX_IDC%3AAUDUSD"),
        CurrencyModel(id: 5, title: "USD / CAD", url: "https://www.tradingview.com/chart/sN7EvZ2z/?symbol=FX_IDC%3AUSDCAD"),
        CurrencyModel(id: 6, title: "USD / CHF", url: "https://www.tradingview.com/chart/sN7EvZ2z/?symbol=FX_IDC%3USDCHF"),
    ]
}


