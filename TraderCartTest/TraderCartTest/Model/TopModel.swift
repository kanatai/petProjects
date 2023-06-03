//
//  TopModel.swift
//  TraderCartTest
//
//  Created by admin on 17/5/23.
//

import Foundation

struct TopModel: Identifiable {
    var id = UUID()
    var number: Int
    var flag: String
    var name: String
    var deposit: Double
    var profit: Double
    
    static var mockData: [TopModel] = [
        TopModel(number: 1, flag: "fl_usa", name: "Oliver", deposit: 2367.0, profit: 336755.0),
        TopModel(number: 2, flag: "fl_canada", name: "Jack", deposit: 1175, profit: 148389),
        TopModel(number: 3, flag: "fl_brazil", name: "Harry", deposit: 1000, profit: 113888),
        TopModel(number: 4, flag: "fl_south_korea", name: "Jacob", deposit: 999, profit: 36755),
        TopModel(number: 5, flag: "fl_germany", name: "Charley", deposit: 888, profit: 18389),
        TopModel(number: 6, flag: "fl_brazil", name: "Tomas", deposit: 777, profit: 12000),
        TopModel(number: 7, flag: "fl_france", name: "George", deposit: 666, profit: 11111),
        TopModel(number: 8, flag: "fl_new_zealand", name: "Oscar", deposit: 555, profit: 9988),
        TopModel(number: 9, flag: "fl_india", name: "James", deposit: 444, profit: 8877),
        TopModel(number: 10, flag: "fl_spain", name: "William", deposit: 333, profit: 6652),
    ]
}

