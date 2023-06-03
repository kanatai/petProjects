//
//  TopViewModel.swift
//  TestTraderProject
//
//  Created by admin on 23/5/23.
//

import Foundation
import SwiftUI

class TopViewModel: ObservableObject {
    @Published var tops: [TopModel] = TopModel.mockData
    @Published var timer = Timer.publish(every: 180, on: .main, in: .common).autoconnect()
    
    let rangeValues = [Int](50...150)
    
    func makeIncreaseTheRangeTops() {
        deleteFirstObject()

        defer { insertFirstObject() }
        
        if let randomRange = rangeValues.randomElement() {
            let randomIndex = Int(arc4random_uniform(UInt32(tops.count)))
            if tops[randomIndex].name != "header" {
                tops[randomIndex].deposit += Double(randomRange)
                tops[randomIndex].profit += Double(randomRange)
                tops = tops.sorted { item1, item2 in
                    item1.profit > item2.profit
                }
            }
        }
    }
    
    func deleteFirstObject() {
        tops.remove(at: 0)
    }
    
    func insertFirstObject() {
        tops.insert(TopModel(number: -1, flag: "header", name: "header", deposit: -1, profit: -1), at: 0)
    }
    
}
