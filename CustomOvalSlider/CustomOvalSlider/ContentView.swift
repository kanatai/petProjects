//
//  ContentView.swift
//  CustomOvalSlider
//
//  Created by admin on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var position = CGPoint(x: 100, y: 0)
    @State var maxWidth: CGFloat = UIScreen.main.bounds.size.width - 48
    @State var sliderWidth: CGFloat = 0

    @State var sliderProgress: CGFloat = 0
    @State var sliderHeight: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    @State private var backgroundColor = Color(UIColor(hex: "#A4FFEF"))
    
    var body: some View {
        ZStack {
            Spacer()
            GeometryReader{ proxy in
                let size = proxy.size
                ZStack {
                    ZStack {
                        //Other stack for slider
                        HStack {
                            ZStack {
                                Rectangle()
                                    .fill(getModifiedColor(Color.teal))
                                    .frame(width: maxWidth * 3)
                                    .cornerRadius(10)
                                    .padding(8)
                                
                                Rectangle()
                                    .fill(.red)
                                    .frame(width: 100, height: 200)
                                    .cornerRadius(10)
                                    .blur(radius: 8)
                            }
                            .mask(
                                Image("curve-nob")
                                    .resizable()
                                    .frame(width: maxWidth * 3, height: 50)
                                    .offset(y: -30)
                            )
                            .frame(width: maxWidth)
                            .offset(x: position.x + 73 - sliderWidth, y: 18)
                            
                        }
                        .frame(width: maxWidth)
                        .mask(
                            LinearGradient(gradient: Gradient(colors: [.clear, .black, .black, .black, .clear]), startPoint: .top, endPoint: .bottom)
                                .frame(width: maxWidth)
                        )
                        
                        HStack { // Slider...
                            ZStack(alignment: .bottom, content: {
                                Rectangle()
                                    .fill(Color(.gray).opacity(0.01))
                            })
                            .frame(width: maxWidth, height: 60)
                            .cornerRadius(10)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged({ (value) in
                                        //getting dragvalue...
                                        let translation = value.translation
                                        print("translation = \(translation)")
                                        sliderWidth = -translation.width + lastDragValue
                                        
                                        //Limiing slide height value
                                        sliderWidth = sliderWidth > maxWidth ? maxWidth : sliderWidth
                                        
                                        sliderWidth = sliderWidth >= 0 ? sliderWidth : 0
                                        
                                        switch sliderProgress {
                                        case 0..<0.5:
                                            backgroundColor = Color(UIColor(hex: "#A4FFEF"))
//                                            selectedMenu = 0
                                        case 0.5..<0.8:
                                            backgroundColor = Color(UIColor(hex: "#FFEDAE"))
//                                            selectedMenu = 1
                                        default:
                                            backgroundColor = Color(UIColor(hex: "#FFC5C5"))
//                                            selectedMenu = 2
                                        }
                                    })
                                    .onEnded({ (value) in
                                        // Storing las drag value for restorating
                                        
                                        sliderWidth = sliderWidth > maxWidth ? maxWidth : sliderWidth
                                        
                                        // Negative height...
                                        
                                        sliderWidth = sliderWidth >= 0 ? sliderWidth : 0
                                        
                                        lastDragValue = sliderWidth
                                })
                            )
                        }
                        .offset(y:0)
                        
                        HStack{
                            Image("nob")
                                .resizable()
                                .frame(width: 48, height: 48)
                                .offset(x: -sliderWidth, y: 0)
                        }
                        .frame(width: maxWidth + 48,
                               height: 48,
                               alignment: .trailing)
                        .zIndex(-1)
                    }
                    .frame(width: maxWidth, height: 120)
                    .padding(.horizontal, 48)
                }
            }
        }
    }
    
    private func getModifiedColor(_ color: Color) -> Color {
        let teal = Color.teal
        let green = Color.green
        let yellow = Color.yellow
        let orange = Color.orange
        let red = Color.red
        
        switch sliderProgress {
        case 0..<0.125:
            return blendColors(teal, green, fraction: sliderProgress / 0.125)
        case 0.125..<0.25:
            return blendColors(green, yellow, fraction: (sliderProgress - 0.125) / 0.125)
        case 0.25..<0.5:
            return blendColors(yellow, orange, fraction: (sliderProgress - 0.25) / 0.25)
        case 0.5..<0.75:
            return blendColors(orange, red, fraction: (sliderProgress - 0.5) / 0.25)
        case 0.75...1:
            return red
        default:
            return color
        }
    }
    
    private func blendColors(_ color1: Color, _ color2: Color, fraction: Double) -> Color {
        let cgColor1 = color1.cgColor
        let cgColor2 = color2.cgColor
        
        guard let components1 = cgColor1?.components, let components2 = cgColor2?.components else {
            return color1
        }
        
        let red = components1[0] * (1 - fraction) + components2[0] * fraction
        let green = components1[1] * (1 - fraction) + components2[1] * fraction
        let blue = components1[2] * (1 - fraction) + components2[2] * fraction
        let alpha = components1[3] * (1 - fraction) + components2[3] * fraction
        
        return Color(red: Double(red), green: Double(green), blue: Double(blue), opacity: Double(alpha))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
