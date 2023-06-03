//
//  CurrencyView.swift
//  TestTraderProject
//
//  Created by admin on 21/5/23.
//

import SwiftUI

struct CurrencyView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CurrencyViewModel
    var callback: ((CurrencyModel) -> ())
    
    init(viewModel: CurrencyViewModel,
         callback: @escaping (CurrencyModel) -> Void
    ) {
        self.viewModel = viewModel
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
                            viewModel.buildView(rowIndex: i, geometry: geometry) { result in
                                callback(result)
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: geometry.size.width,
                   maxHeight: .infinity)
            .background(Color("bg_color"),
                        ignoresSafeAreaEdges: .all)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("arrow_left")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                }
            }
            
            ToolbarItem(placement: .principal) {
                CustomTitleNV(title: .constant("Currency pair"))
            }
        }
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView(viewModel: CurrencyViewModel(currency: CurrencyModel.listCurrency.last ?? nil)) { result in
            
        }
    }
}
