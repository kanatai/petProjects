//
//  ConvertTime.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import Foundation

class ConvertTime {
    static var shared = ConvertTime()
    
    
    func fetchTime(time: String) -> (Int, Int) {
        let time = time.split(separator: ":")
        return (Int(time[0]) ?? 0, Int(time[1]) ?? 0) // (hour, minute)
    }
    
    func convertRightTime(hour: Int, minute: Int) -> String {
        var h = "\(hour)"
        var m = "\(minute)"
        if hour < 10 { h = "0\(hour)" }
        if minute < 10 { m = "0\(minute)" }
        
        return "\(h):\(m)"
    }
}
