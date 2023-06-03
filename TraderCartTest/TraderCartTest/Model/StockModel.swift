//
//  StockModel.swift
//  TraderCartTest
//
//  Created by admin on 16/5/23.
//

import Foundation

struct Stock: Identifiable {
    var id = UUID()
    var name: String
    var day: Int
    var openPrice: Double
    var highPrice: Double
    var lowPrice: Double
    var closePrice: Double
    var isHigh: Bool = false
}

extension Stock {
    static var exampleData: [Stock] =
        [
            Stock(name: "BTC",
                  day: 1,
                  openPrice: 146.78,
                  highPrice: 189.23,
                  lowPrice: 135.90,
                  closePrice: 168.44,
                  isHigh: true),
            Stock(name: "BTC",
                  day: 2,
                  openPrice: 168.60,
                  highPrice: 179.19,
                  lowPrice: 159.90,
                  closePrice: 175.54,
                  isHigh: true),
            Stock(name: "BTC",
                  day: 3,
                  openPrice: 169.77,
                  highPrice: 186.23,
                  lowPrice: 161.43,
                  closePrice: 180.54,
                  isHigh: true),
            Stock(name: "BTC",
                  day: 4,
                  openPrice: 168.53,
                  highPrice: 188.67,
                  lowPrice: 163.99,
                  closePrice: 180.68,
                  isHigh: true),
            Stock(name: "BTC",
                  day: 5,
                  openPrice: 192.89,
                  highPrice: 201.85,
                  lowPrice: 188.68,
                  closePrice: 199.10,
                  isHigh: true),
            Stock(name: "BTC",
                  day: 6,
                  openPrice: 68.43,
                  highPrice: 89.43,
                  lowPrice: 67.34,
                  closePrice: 88.93),
            Stock(name: "BTC",
                  day: 7,
                  openPrice: 59.54,
                  highPrice: 77.55,
                  lowPrice: 58.84,
                  closePrice: 74.34),
            Stock(name: "BTC",
                  day: 8,
                  openPrice: 53.67,
                  highPrice: 69.67,
                  lowPrice: 52.63,
                  closePrice: 67.79),
            Stock(name: "BTC",
                  day: 9,
                  openPrice: 52.43,
                  highPrice: 62.56,
                  lowPrice: 50.79,
                  closePrice: 60.10),
            Stock(name: "BTC",
                  day: 10,
                  openPrice: 42.23,
                  highPrice: 51.89,
                  lowPrice: 40.17,
                  closePrice: 38.50)
        ]
}
