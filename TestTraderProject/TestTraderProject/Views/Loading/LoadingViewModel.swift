//
//  LoadingViewModel.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import Foundation
import SwiftUI

@MainActor class LoadingViewModel: ObservableObject {
    @Published var progressValue: Float = 0.0
    @Published var procentValue: Float = 0.0
    @Published var isFinish: Bool = false
    @Published var goToTabView: Bool = false
    @Published var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    func registerForNotification() {
        //For device token and push notifications.
        UIApplication.shared.registerForRemoteNotifications()
        
        let center : UNUserNotificationCenter = UNUserNotificationCenter.current()
        //center.delegate = self
        
        center.requestAuthorization(options: [.sound , .alert , .badge], completionHandler: { (granted, error) in
            if ((error != nil)) { UIApplication.shared.registerForRemoteNotifications() }
            else {
                self.goToTabView = true
            }
        })
    }
    
    func checkBalance() {
        var balance = UserDefaults.standard.integer(forKey: "total_balance")
        if balance == 0 {
            UserDefaults.standard.set(10000, forKey: "total_balance")
        }
    }
    
    func checkInvestnvent() {
        var investment = UserDefaults.standard.string(forKey: "investment_balance") ?? ""
        if investment.isEmpty {
            UserDefaults.standard.set("100", forKey: "investment_balance")
        }
    }
    
    func checkTimeSellBuy() {
        var investment = UserDefaults.standard.string(forKey: "time_sell_buy") ?? ""
        if investment.isEmpty {
            UserDefaults.standard.set("00:01", forKey: "time_sell_buy")
        }
    }
}
