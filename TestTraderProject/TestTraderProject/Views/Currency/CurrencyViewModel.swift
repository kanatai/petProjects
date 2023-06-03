//
//  CurrencyViewModel.swift
//  TestTraderProject
//
//  Created by admin on 21/5/23.
//
import Foundation
import SwiftUI

class CurrencyViewModel: ObservableObject {
    @Published var currency: CurrencyModel? = nil
    @Published var currencies: [CurrencyModel] = CurrencyModel.listCurrency
    
    let itemPerRow: CGFloat = 2
    let horizontalSpacing: CGFloat = 16
    let height: CGFloat = 54
    
    init(currency: CurrencyModel? = nil) {
        self.currency = currency
    }
    
    func getWidth(geometry: GeometryProxy) -> CGFloat {
        let width: CGFloat = (geometry.size.width - horizontalSpacing * (itemPerRow + 1)) / itemPerRow
        return width
    }
    
    func buildView(rowIndex: Int,
                   geometry: GeometryProxy,
                   callback: @escaping (CurrencyModel) -> Void
    ) -> RowView? {
        var rowCurrencies = [CurrencyModel]()
        for itemIndex in 0..<Int(itemPerRow) {
            if rowIndex + itemIndex < currencies.count {
                rowCurrencies.append(currencies[rowIndex + itemIndex])
            }
        }
        if !rowCurrencies.isEmpty {
            return RowView(currencies: rowCurrencies,
                           currency: currency!,
                           width: getWidth(geometry: geometry),
                           height: height,
                           horizontalSpacing: horizontalSpacing, callback: callback)
        }
        
        return nil
    }
}
