//
//  LoadingView.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import SwiftUI

struct LoadingView: View {
    @ObservedObject var viewModel: LoadingViewModel = LoadingViewModel()
    
    var body: some View {
        NavigationStack(root: {
            GeometryReader { proxy in
                VStack {
//                    if !viewModel.isFinish {
//                        ProgressBarView(value: $viewModel.progressValue,
//                                        procentValue: $viewModel.procentValue)
//                        .frame(height: 20)
//                        .padding(.horizontal, 38)
//                        .onReceive(viewModel.timer) { _ in
//                            if viewModel.progressValue < 2 && viewModel.procentValue < 100 {
//                                viewModel.procentValue += 1.5
//                                viewModel.progressValue += 0.015
//                            } else {
//                                viewModel.timer.upstream.connect().cancel()
//                                viewModel.isFinish.toggle()
//                            }
//                        }
//                    } else {
                        Spacer()

                        Button {
                            viewModel.registerForNotification()
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
                            .padding(.bottom, 24)
                        }
//                    }
                }
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .background(
                    Image("background_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity )
                        .edgesIgnoringSafeArea(.all)
                )
                .onAppear {
                    viewModel.checkBalance()
                }
                .navigationDestination(isPresented: $viewModel.goToTabView) {
                    TabbarView()
                }
            }
        })
        .navigationViewStyle(.stack)
        .accentColor(.primary)
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .previewDevice("iPhone SE (3rd generation)")
        
        LoadingView()
            .previewDevice("iPhone 14 Pro")
        
        LoadingView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
