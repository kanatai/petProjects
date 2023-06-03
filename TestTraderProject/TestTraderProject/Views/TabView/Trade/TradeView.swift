//
//  TradeView.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import SwiftUI

struct TradeView: View {
    @ObservedObject var viewModel: TradeViewModel = TradeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { proxy in
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center, spacing: 0) {
                            BalanceView
                                .frame(maxWidth: .infinity,
                                       minHeight: 54.0,
                                       maxHeight: 54.0)
                                .background(Color("secondary_bg_color"))
                                .cornerRadius(12)
                                .padding(.horizontal, 30)
                                .padding(.bottom, 25)
                            
                            WebView(webView: viewModel.webView)
                                .frame(width: proxy.size.width,
                                       height: proxy.size.width * 0.85)
                            
                            VStack(alignment: .center, spacing: 10) {
                                Button {
                                    viewModel.goToCurrencyPair.toggle()
                                } label: {
                                    CurrencyButtonView(viewModel: viewModel)
                                        .frame(maxWidth: .infinity,
                                               minHeight: 54.0,
                                               maxHeight: 54.0)
                                        .background(Color("secondary_bg_color"))
                                        .cornerRadius(12)
                                        .padding(.top, 16)
                                        .padding(.horizontal, 30)
                                }
                                
                                HStack(spacing: 10) {
                                    ModificateTIView(viewModel: viewModel,
                                                     title: "Timer",
                                                     modifire: .timer)
                                    
                                    ModificateTIView(viewModel: viewModel,
                                                     title: "Investment",
                                                     modifire: .investment)
                                }
                                .frame(maxWidth: .infinity,
                                       minHeight: 54.0,
                                       maxHeight: 54.0)
                                .padding(.horizontal, 30)
                                
                                HStack(spacing: 10) {
                                    SellBuyButtonView(title: "Sell", color: Color("red")) {
                                        viewModel.typeOperation(type: .sell)
                                    }
                                    
                                    SellBuyButtonView(title: "Buy", color: Color("green")) {
                                        viewModel.typeOperation(type: .buy)
                                    }
                                }
                                .frame(maxWidth: .infinity,
                                       minHeight: 54.0,
                                       maxHeight: 54.0)
                                .padding(.horizontal, 30)
                            }
                            .frame(maxWidth: .infinity)
                            .background(viewModel.isTimerActivate || viewModel.isInvestmentActivate ? Color("bg_color") : .clear)
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                    }
                }
            }
            .frame(maxHeight: .infinity)
            .background(Color("bg_color"), ignoresSafeAreaEdges: .all)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    CustomTitleNV(title: .constant("Trade"))
                }
            }
            .toolbarBackground(Color("tabbar_bg_color"), for: .navigationBar)
            .navigationDestination(isPresented: $viewModel.goToCurrencyPair) {
                CurrencyView(viewModel: CurrencyViewModel(currency: viewModel.currentCurrency!)
                ) { result in
                    viewModel.currentCurrency = result
                    UserDefaults.standard.set(result.id,
                                              forKey: "current_currency")
                    viewModel.loadUrl()
                }
            }
            .toastView(toast: $viewModel.toast) {
                viewModel.loadUrl()
            }
        }
    }
    
    var BalanceView: some View {
        VStack {
            Text("Balance")
                .foregroundColor(Color("tc_C8C8C8"))
                .font(Font.custom("Inter-Medium", size: 12))
            
            Text("\(viewModel.totalBalnce)")
                .foregroundColor(.white)
                .font(Font.custom("SFProText-Bold", size: 16))
        }
    }
}



struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView()
            .previewDevice("iPhone SE (3rd generation)")
        
        TradeView()
            .previewDevice("iPhone 14 Pro")
        
        TradeView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
