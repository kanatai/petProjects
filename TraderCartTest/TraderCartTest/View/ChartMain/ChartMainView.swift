//
//  ChartMainView.swift
//  TraderCartTest
//
//  Created by admin on 16/5/23.
//

import SwiftUI
import Charts

struct ChartMainView: View {
    
    @State var stocks: [Stock] = Stock.exampleData
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Chart {
                    ForEach(stocks) { item in
                        RectangleMark(
                            x: .value("Day", item.day),
                            yStart: .value("Low Price", item.lowPrice),
                            yEnd: .value("High Price", item.highPrice),
                            width: 1)
                        .foregroundStyle(Color(item.isHigh ? "green" : "red"))
                        
                        RectangleMark(
                            x: .value("Day", item.day),
                            yStart: .value("Open Price", item.openPrice),
                            yEnd: .value("Close Price", item.closePrice),
                            width: 4)
                        .foregroundStyle(Color(item.isHigh ? "green" : "red"))
                    }
                }
//                .chartForegroundStyleScale(.linear)
                .frame(height: 400)
                .padding(.all, 8)
            }
            .foregroundColor(.white)
            .padding()
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .top)
        .background(Color("bg_color"),
                    ignoresSafeAreaEdges: .all)

    }
    
    func fetchHigh(stock: Stock) -> Bool {
        var currentStock = stock
        var previusStock = stock
        for i in 0...stocks.count - 1 {
            if stocks[i].id == stock.id {
                currentStock = stocks[i]
                previusStock = stocks[i - 1]
            }
        }
        
        return currentStock.closePrice < previusStock.closePrice ? false : true
    }
}

struct ChartMainView_Previews: PreviewProvider {
    static var previews: some View {
        ChartMainView()
    }
}
