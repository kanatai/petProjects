//
//  LoadingView.swift
//  TraderCartTest
//
//  Created by admin on 16/5/23.
//

import SwiftUI

struct LoadingView: View {
    
    @EnvironmentObject var viewModel: LoadingViewModel
    @StateObject var vmTrade: TradeViewModel = TradeViewModel()
    
    var body: some View {
        ZStack {
            Image("background_image")
                .resizable()
            if viewModel.isFinish {
                VStack {
                    Spacer()
                    Button {
                        //Ask permission notification
                        registerForNotification()
                    } label: {
                        HStack(alignment: .center) {
                            Text("Activate NOW")
                                .foregroundColor(.white)
                                .font(Font.custom("SFProText-Bold", size: 18))
                        }
                        .frame(maxWidth: .infinity, maxHeight: 54.0)
                        .background(Color("green"))
                        .cornerRadius(12)
                        .padding(.horizontal, 30)
                    }
                    .padding(.bottom, 58)
                }
            } else {
                VStack {
                    ProgressBarView(value: $viewModel.progressValue,
                                    procentValue: $viewModel.procentValue)
                    .frame(height: 20)
                    .onReceive(viewModel.timer) { _ in
                        if viewModel.progressValue < 2 && viewModel.procentValue < 100 {
                            viewModel.procentValue += 1.5
                            viewModel.progressValue += 0.015
                        } else {
                            viewModel.timer.upstream.connect().cancel()
                            viewModel.isFinish.toggle()
                        }
                    }
                }
                .padding()
            }
        }
        .navigationDestination(isPresented: $viewModel.move) {
            TabbarView()
                .environmentObject(vmTrade)
        }
        .ignoresSafeArea(.all)
    }
    func registerForNotification() {
        //For device token and push notifications.
        UIApplication.shared.registerForRemoteNotifications()
        
        let center : UNUserNotificationCenter = UNUserNotificationCenter.current()
        //center.delegate = self
        
        center.requestAuthorization(options: [.sound , .alert , .badge], completionHandler: { (granted, error) in
            if ((error != nil)) { UIApplication.shared.registerForRemoteNotifications() }
            else {
                viewModel.move = true
            }
        })
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .environmentObject(LoadingViewModel())
    }
}
