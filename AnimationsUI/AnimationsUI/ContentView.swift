//
//  ContentView.swift
//  AnimationsUI
//
//  Created by Kanatbek Torogeldiev on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isSubscribed = false
    @State private var animatingCircle = false
    @State private var animatingButton = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            
            // making list cell
            VStack(spacing: 50) {
                HStack {
                    Text(isSubscribed ? "Un Subscribed" : "Subscribed")
                        .bold()
                        .opacity(isSubscribed ? 1.0 : 0.5)
                    
                    Spacer()
                    
                    Image(systemName: isSubscribed ? "checkmark.circle.fill" : "circle")
                        .font(.system(size: 24.0))
                        .scaleEffect(isSubscribed ? 1.25 : 1.0)
                        .foregroundColor(isSubscribed ? .green : .black)
                        .padding()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isSubscribed.toggle()
                            }
                        }
                }
                .padding()
                .background(.ultraThinMaterial,
                            in: RoundedRectangle(cornerRadius: 20,
                                             style: .continuous))
                
                // shaping with spring
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.linearGradient(colors: [.cyan, .green],
                                                     startPoint: .topTrailing,
                                                     endPoint: .bottomLeading))
                    .offset(x: animatingCircle ? 30 : 0,
                            y: animatingCircle ? -100 : 0)
                    .scaleEffect(animatingCircle ? 2.0 : 1.0)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0)) {
                            animatingCircle.toggle()
                        }
                    }
                
                // button animation
                Button {
                    withAnimation(
                        .easeInOut(duration: 0.3)
                        .repeatCount(10)
                    ) {
                        animatingButton.toggle()
                    }
                    
                } label: {
                    Text("Animate")
                        .bold()
                        .frame(width: 200, height: 50)
                        .foregroundStyle(.indigo)
                        .background(LinearGradient(colors: [.mint, .white],
                                                   startPoint: .bottomLeading,
                                                   endPoint: .topTrailing))
                        .clipShape(RoundedRectangle(cornerRadius: 20,
                                                    style: .continuous))
                        .shadow(radius: 3)
                        .opacity(animatingButton ? 1.0 : 0.7)
                        .scaleEffect(animatingButton ? 1.5 : 1.0)
                        .padding()
                }
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
