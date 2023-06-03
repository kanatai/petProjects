//
//  CurrencyPairView.swift
//  TraderCartTest
//
//  Created by admin on 19/5/23.
//

import SwiftUI

struct CurrencyPairView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: CurrencyViewModel
    
    var callback: ((CurrencyModel) -> ())
    
    init(callback: @escaping (CurrencyModel) -> Void) {
        self.callback = callback
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(0..<viewModel.currencies.count) { i in
                        // 5. Process the first index of each row
                        if i % Int(viewModel.itemPerRow) == 0 {
                            // 6. Get view
                            buildView(rowIndex: i, geometry: geometry)
                        }
                    }
                }
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: geometry.size.width, maxHeight: .infinity)
            .background(Color("bg_color"),ignoresSafeAreaEdges: .all)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { presentationMode.wrappedValue.dismiss() }
                    label: {
                        Image(systemName: "arrow_left")
                            .foregroundColor(.white)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    CustomTitleNV(title: .constant("Currency pair"))
                }
            }
        }
        
    }
    
    func buildView(rowIndex: Int, geometry: GeometryProxy) -> RowView? {
        var rowCurrencies = [CurrencyModel]()
        for itemIndex in 0..<Int(viewModel.itemPerRow) {
            // 8. Check if got two item in counts, then insert it properly
            if rowIndex + itemIndex < viewModel.currencies.count {
                rowCurrencies.append(viewModel.currencies[rowIndex + itemIndex])
            }
        }
        if !rowCurrencies.isEmpty {
            return RowView(currencies: rowCurrencies,
                           currency: viewModel.currency!,
                           width: getWidth(geometry: geometry),
                           height: viewModel.height,
                           horizontalSpacing: viewModel.horizontalSpacing) { result in
                callback(result)
                presentationMode.wrappedValue.dismiss()
            }
        }
        
        return nil
    }
    
    func getWidth(geometry: GeometryProxy) -> CGFloat {
        let width: CGFloat = (geometry.size.width - viewModel.horizontalSpacing * (viewModel.itemPerRow + 1)) / viewModel.itemPerRow
        return width
    }
}

struct RowView: View {
    let currencies: [CurrencyModel]
    let currency: CurrencyModel
    let width: CGFloat
    let height: CGFloat
    let horizontalSpacing: CGFloat
    let callback: ((CurrencyModel) -> ())
    
    init(currencies: [CurrencyModel] = [],
         currency: CurrencyModel,
         width: CGFloat,
         height: CGFloat,
         horizontalSpacing: CGFloat,
         callback: @escaping (CurrencyModel) -> Void
    ) {
        self.currencies = currencies
        self.currency = currency
        self.width = width
        self.height = height
        self.horizontalSpacing = horizontalSpacing
        self.callback = callback
    }
    
    var body: some View {
        HStack(spacing: horizontalSpacing) {
            ForEach(currencies, id: \.id) { item in
                ItemView(item: item,
                         currentCurrency: currency, callback: callback)
                .frame(width: width, height: height)
            }
        }
        .padding()
    }
}

struct ItemView: View {
    
    let item: CurrencyModel
    let currentCurrency: CurrencyModel
    let callback: ((CurrencyModel) -> ())
    
    init(item: CurrencyModel,
         currentCurrency: CurrencyModel,
         callback: @escaping (CurrencyModel) -> Void
    ) {
        self.item = item
        self.currentCurrency = currentCurrency
        self.callback = callback
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text(item.title)
                .font(Font.custom("SFProText-Semibold", size: 14))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 54.0)
        .background(item.id == currentCurrency.id ? Color("green") : Color("secondary_bg_color"))
        .cornerRadius(12)
        .onTapGesture {
            callback(item)
        }
    }
}

struct CurrencyPairView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPairView { result in
            
        }
        .environmentObject(
            CurrencyViewModel(currency: CurrencyModel.listCurrency.last ?? nil)
        )
            
    }
}
