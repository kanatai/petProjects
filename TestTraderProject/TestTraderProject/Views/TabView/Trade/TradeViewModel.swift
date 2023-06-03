//
//  TradeViewModel.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import Foundation
import WebKit
import SwiftUI

class TradeViewModel: ObservableObject {
    @Published var toast: ToastModel? = nil
    @Published var currentCurrency: CurrencyModel? = nil
    
    @Published var urlString: String = ""
    
    @AppStorage("investment_balance") var investment: String = "100"
    @AppStorage("time_sell_buy") var time: String = "00:01"
    @AppStorage("total_balance") var totalBalnce: Int = 10000

    @Published var isTimerActivate: Bool = false
    @Published var isInvestmentActivate: Bool = false
    @Published var goToCurrencyPair: Bool = false
    
    let webView: WKWebView
    
    init() {
        webView = WKWebView(frame: .zero)
        fetchCurrentCurrency()
        loadUrl()
    }
    
    func loadUrl() {
        print(urlString)
        guard let url = URL(string: urlString) else { return }
        webView.load(URLRequest(url: url))
    }
    
    func fetchCurrentCurrency() {
        let id = UserDefaults.standard.integer(forKey: "current_currency")
        
        if id == 0 {
            currentCurrency = CurrencyModel.listCurrency.first!
        } else {
            currentCurrency = CurrencyModel.listCurrency.first { item in item.id == id }!
        }
        
        if let url = currentCurrency?.url {
            urlString = url
        }
    }
    
    func showSuccessToast() {
        toast = ToastModel(type: .success, title: "Successfully", message: "Deal has been completed successfully")
    }
    
    func showErrorToast() {
        toast = ToastModel(type: .error, title: "Attantion", message: "Insufficient funds")
    }
    
    func typeOperation(type: EnumOperation) {
        switch type {
        case .sell:
            if calculateForSellBalance() {
                saveInvestment()
            }
        case .buy:
            if calculateForBuyBalance() {
                saveInvestment()
            }
        }
    }
    func saveInvestment() {
        saveTotalBalance()
        UserDefaults.standard.set(investment, forKey: "investment_balance")
    }
    
    func saveTotalBalance() {
        UserDefaults.standard.set(totalBalnce, forKey: "total_balance")
        showSuccessToast()
    }
    
    func saveTimer() {
        UserDefaults.standard.set(time, forKey: "time_sell_buy")
    }
    
    func settingModifire(type: ModifireTypeEnums, action: ModifireActionEnums) {
        switch type {
            case .timer:
                timePlusMines(action: action)
            case .investment: 
                investmentPlusMines(action: action)
        }
    }
    
    func timePlusMines(action: ModifireActionEnums) {
        var (hour, minute) = ConvertTime.shared.fetchTime(time: time)
        
        defer {
            time = ConvertTime.shared.convertRightTime(hour: hour, minute: minute)
        }
        
        switch action {
            case .plus:
                timePlus(hour: &hour, minute: &minute)
            case .mines:
                timeMines(hour: &hour, minute: &minute)
        }
    }
    
    func investmentPlusMines(action: ModifireActionEnums) {
        var invest = Int(investment) ?? 100
        switch action {
            case .plus:
                invest = invest + 100
            case .mines:
                if invest > 100 {
                    invest = invest - 100
                }
        }
        investment = "\(invest)"
    }
    
    func timePlus(hour: inout Int, minute: inout Int) {
        minute += 1
        if minute > 59 {
            hour += 1
            minute = 0
        } else {
            minute += 1
        }
    }
    
    func timeMines(hour: inout Int, minute: inout Int) {
        if hour >= 0 {
            if minute < 1 {
                hour -= 1
                minute = 59
            } else if minute > 1 {
                minute -= 1
            }
        }
        dump(minute)
    }
    
    func calculateForBuyBalance() -> Bool {
        let investment = Int(investment) ?? 0
        if totalBalnce >= investment {
            totalBalnce = totalBalnce - investment
            return true
        } else {
            showErrorToast()
        }
        return false
    }
    
    func calculateForSellBalance() -> Bool {
        let investment = Int(investment) ?? 0
        if totalBalnce >= investment {
            totalBalnce = totalBalnce + investment
            return true
        } else {
            showErrorToast()
        }
        return false
    }
}
