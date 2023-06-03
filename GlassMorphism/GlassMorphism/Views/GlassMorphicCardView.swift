//
//  GlassMorphicCardView.swift
//  GlassMorphism
//
//  Created by admin on 28/5/23.
//

import SwiftUI

struct GlassMorphicCardView: View {
    var body: some View {
        
        let width = UIScreen.main.bounds.width
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .opacity(0.1)
                .frame(width: width / 1.7, height: 270)
                .background(
                    Color.white
                        .opacity(0.08)
                        .blur(radius: 10)
                )
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(
                            .linearGradient(
                                .init(colors: [Color("Purple"),
                                               Color("Purple"),
                                               .clear,
                                               .clear,
                                               Color("LightBlue")]
                                     ),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                            ,lineWidth: 2.5
                        )
                        .padding(2)
                )
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
            
            VStack {
                Image(systemName: "sun.max")
                    .font(.system(size: 75, weight: .thin))
                
                Text("18")
                    .font(.system(size: 85, weight: .bold))
                    .padding(.top, 2)
                    .overlay(
                        Text("℃")
                            .font(.title2)
                            .foregroundColor(.white.opacity(0.7))
                            .offset(x: 30, y: 15)
                        , alignment: .topTrailing
                    )
                    .offset(x: -6)
                
                Text("Cracow, Poland")
                    .font(.title3)
                    .foregroundColor(Color.white.opacity(0.4))
                
            }
        }
    }
}

struct GlassMorphicCardView_Previews: PreviewProvider {
    static var previews: some View {
        GlassMorphicCardView()
    }
}
