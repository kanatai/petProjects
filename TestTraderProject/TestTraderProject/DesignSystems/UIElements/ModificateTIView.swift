//
//  ModificateTIView.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import SwiftUI

struct ModificateTIView: View {
    @ObservedObject var viewModel: TradeViewModel
    let title: String
    let modifire: ModifireTypeEnums
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .foregroundColor(Color("tc_C8C8C8"))
                .font(Font.custom("Inter-Medium", size: 12))
                .padding(.top, 5)
            
            HStack(spacing: 11) {
                Button {
                    viewModel.settingModifire(type: modifire, action: .mines)
                } label: {
                    Image("minus_cirlce")
                        .frame(width: 24,
                               height: 24,
                               alignment: .center)
                        .padding(.leading, 10)
                        .padding(.bottom, 5)
                }
                
                TextField(modifire == .timer ? viewModel.time : viewModel.investment,
                          text: modifire == .timer ? $viewModel.time : $viewModel.investment
                ) { edited in
                    if modifire == .timer {
                        viewModel.isTimerActivate = edited
                    } else {
                        viewModel.isInvestmentActivate = edited
                    }
                }
                .font(Font.custom("SFProText-Bold", size: 16))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 100,
                       maxHeight: 30,
                       alignment: .center)
                .padding(.bottom, 10)
                .textContentType(.oneTimeCode)
                .keyboardType(.numberPad)
                
                Button {
                    viewModel.settingModifire(type: modifire, action: .plus)
                } label: {
                    Image("add_circle")
                        .frame(width: 24,
                                height: 24,
                                alignment: .center)
                        .padding(.trailing, 10)
                        .padding(.bottom, 5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: 54.0)
        .background(Color("secondary_bg_color"))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(viewModel.isTimerActivate ? Color("green") : .clear, lineWidth: 1)
        )
    }
}

struct ModificateTIView_Previews: PreviewProvider {
    static var previews: some View {
        ModificateTIView(viewModel: TradeViewModel(), title: "Investment", modifire: .investment)
    }
}
