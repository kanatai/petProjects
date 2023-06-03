//
//  CurrencyButtonView.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import SwiftUI

struct CurrencyButtonView: View {
    @ObservedObject var viewModel: TradeViewModel
    
    init(viewModel: TradeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(viewModel.currentCurrency?.title ?? "")
                .frame(alignment: .center)
                .padding(.leading, 25)
                .foregroundColor(.white)
                .font(Font.custom("SFProText-Bold", size: 16))
            Spacer()
            Image("arrow_left")
                .rotationEffect(Angle(degrees: 180.0))
                .padding(.trailing, 11)
                .frame(width: 24,
                       height: 24,
                       alignment: .trailing)
        }
    }
}

struct CurrencyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyButtonView(viewModel: TradeViewModel())
    }
}
