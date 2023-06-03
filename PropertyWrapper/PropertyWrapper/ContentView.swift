//
//  ContentView.swift
//  PropertyWrapper
//
//  Created by admin on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var counter: Counter
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
//                    ChildView(counter: counter) //для StateObject
                    ChildView()
                        .environmentObject(counter)
                } label: {
                    Text("Click")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
