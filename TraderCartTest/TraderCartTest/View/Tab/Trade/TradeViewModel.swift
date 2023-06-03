//
//  TradeViewModel.swift
//  TraderCartTest
//
//  Created by admin on 17/5/23.
//

import Foundation
import WebKit

class TradeViewModel: ObservableObject {
    @Published var toast: ToastModel? = nil
    @Published var currentCurrency: CurrencyModel = {
        let id = UserDefaults.standard.integer(forKey: "current_currency")
        if id == 0 {
            return CurrencyModel.listCurrency.first!
        } else {
            dump(CurrencyModel.listCurrency.first { item in
                item.id == id
            }!)
            return CurrencyModel.listCurrency.first { item in
                item.id == id
            }!
        }
    }()

    @Published var isTimerActivate: Bool = false
    @Published var isInvestmentActivate: Bool = false
    @Published var toCurrencyPair: Bool = false
    @Published var timer: String = "00:01"
    @Published var investment: String = "1000"
    @Published var urlString = ""
    
    let webView: WKWebView
    
    init() {
        webView = WKWebView(frame: .zero)
    }
    
    func loadUrl() {
        print(urlString)
        guard let url = URL(string: urlString) else { return }
        webView.load(URLRequest(url: url))
    }
}
