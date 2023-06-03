//
//  TradeView.swift
//  TraderCartTest
//
//  Created by admin on 17/5/23.
//

import SwiftUI

struct TradeView: View {
    @EnvironmentObject var viewModel: TradeViewModel
    
    var body: some View {
        
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 0) {
                    VStack {
                        Text("Balance")
                            .foregroundColor(Color("tc_C8C8C8"))
                            .font(Font.custom("Inter-Medium", size: 12))
                        
                        Text("10 000")
                            .foregroundColor(.white)
                            .font(Font.custom("SFProText-Bold", size: 16))
                    }
                    .frame(maxWidth: .infinity,
                            minHeight: 54.0,
                            maxHeight: 54.0)
                    .background(Color("secondary_bg_color"))
                    .cornerRadius(12)
                    .padding(.horizontal, 30)
                    
                    ChartWebView(webView: viewModel.webView)
                        .background(Color.clear)
                        .frame(width: proxy.size.width, height: 324)
                        .padding(.top, 25)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Button {
                            viewModel.toCurrencyPair.toggle()
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
                            VStack(spacing: 0) {
                                Text("Timer")
                                    .foregroundColor(Color("tc_C8C8C8"))
                                    .font(Font.custom("Inter-Medium", size: 12))
                                    .padding(.top, 5)
                                
                                HStack(spacing: 11) {
                                    Button {
                                        //
                                    } label: {
                                        Image("minus_cirlce")
                                            .frame(width: 24,
                                                    height: 24,
                                                    alignment: .center)
                                            .padding(.leading, 10)
                                            .padding(.bottom, 5)
                                    }
                                    
                                    TextField(viewModel.timer,
                                                text: $viewModel.timer) { edited in
                                        viewModel.isTimerActivate = edited
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
                                        //
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
                            
                            VStack(spacing: 0) {
                                Text("Investment")
                                    .foregroundColor(Color("tc_C8C8C8"))
                                    .font(Font.custom("Inter-Medium", size: 12))
                                    .padding(.top, 5)
                                
                                HStack(spacing: 11) {
                                    Button {
                                        //
                                    } label: {
                                        Image("minus_cirlce")
                                            .frame(width: 24,
                                                    height: 24,
                                                    alignment: .center)
                                            .padding(.leading, 10)
                                            .padding(.bottom, 5)
                                    }
                                    
                                    TextField(viewModel.investment,
                                                text: $viewModel.investment) { edited in
                                        viewModel.isInvestmentActivate = edited
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
                                        //
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
                                    .stroke(viewModel.isInvestmentActivate ? Color("green") : .clear, lineWidth: 1)
                            )
                        }
                        .frame(maxWidth: .infinity,
                                minHeight: 54.0,
                                maxHeight: 54.0)
                        .padding(.horizontal, 30)
                        
                        HStack(spacing: 10) {
                            Button {
                                viewModel.toast = ToastModel(type: .success, title: "Successfully", message: "Deal has been completed successfully")
                            } label: {
                                Text("Sell")
                                    .frame(maxWidth: .infinity,
                                            minHeight: 54.0,
                                            maxHeight: 54.0,
                                            alignment: .leading)
                                    .foregroundColor(.white)
                                    .font(Font.custom("Inter-Medium", size: 24))
                                    .padding(.leading, 20)
                                    .background(Color("red"))
                                    .cornerRadius(12)
                            }

                            Button {
                                viewModel.toast = ToastModel(type: .success, title: "Successfully", message: "Deal has been completed successfully")
                            } label: {
                                Text("Buy")
                                    .frame(maxWidth: .infinity,
                                            minHeight: 54.0,
                                            maxHeight: 54.0,
                                            alignment: .leading)
                                    .foregroundColor(.white)
                                    .font(Font.custom("Inter-Medium", size: 24))
                                    .padding(.leading, 20)
                                    .background(Color("green"))
                                    .cornerRadius(12)
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
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        CustomTitleNV(title: .constant("Trade"))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bg_color"),ignoresSafeAreaEdges: .all)
        .navigationDestination(isPresented: $viewModel.toCurrencyPair) {
            CurrencyPairView { result in
                viewModel.toCurrencyPair.toggle()
                UserDefaults.standard.set(result.id,
                                          forKey: "current_currency")
                viewModel.loadUrl()
            }
            .environmentObject(CurrencyViewModel(currency: viewModel.currentCurrency))
        }
        .toastView(toast: $viewModel.toast)
    }
}

struct CurrencyButtonView: View {
    let viewModel: TradeViewModel
    
    init(viewModel: TradeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Spacer()
                Text(viewModel.currentCurrency.title)
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
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView()
            .environmentObject(TradeViewModel())
    }
}
