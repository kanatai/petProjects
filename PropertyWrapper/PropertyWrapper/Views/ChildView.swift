//
//  ChildView.swift
//  PropertyWrapper
//
//  Created by admin on 3/3/23.
//

import SwiftUI

struct ChildView: View {
    @EnvironmentObject var counter: Counter
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            if colorScheme == .light {
                Text("Состояние \(counter.number)")
                    .foregroundColor(.yellow)
            } else {
                Text("Состояние \(counter.number)")
                    .foregroundColor(.blue)
            }
            
            Button("Увеличить состояние") {
                counter.number += 1
                print("Состояние \(counter.number)")
            }
        }
        .padding()
    }
}
