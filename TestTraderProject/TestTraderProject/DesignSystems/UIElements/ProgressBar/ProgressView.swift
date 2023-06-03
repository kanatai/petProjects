//
//  ProgressView.swift
//  TestTraderProject
//
//  Created by admin on 23/5/23.
//

import SwiftUI

struct ProgressView: View {
    @State private var drawingWidth = false
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text("RAM")
                    .bold()
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: proxy.size.width, height: 24)
                        .opacity(0.3)
                        .foregroundColor(Color("bg_progress"))
                    
                    Rectangle()
                        .frame(
                            width: drawingWidth ? proxy.size.width : 0,
                            height: 24,
                            alignment: .leading)
                        .foregroundColor(Color("green"))
                        .animation(.linear, value: true)
                        .cornerRadius(45)
                        .animation(.easeInOut(duration: 10).repeatForever(autoreverses: false), value: drawingWidth)
                }
                .frame(width: 250, height: 12)
                .onAppear {
                    drawingWidth.toggle()
                }
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
