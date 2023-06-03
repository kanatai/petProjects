//
//  LoadingViewModel.swift
//  TraderCartTest
//
//  Created by admin on 17/5/23.
//

import Foundation

class LoadingViewModel: ObservableObject {
    @Published var progressValue: Float = 0.0
    @Published var procentValue: Float = 0.0
    @Published var isFinish: Bool = false
    @Published var move: Bool = false
    @Published var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
}
