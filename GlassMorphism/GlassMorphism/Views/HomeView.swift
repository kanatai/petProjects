//
//  HomeView.swift
//  GlassMorphism
//
//  Created by admin on 27/5/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("BG1"), Color("BG2")],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            //Glass background
            GeometryReader { proxy in
                let size = proxy.size
                
                //Slighlty Darkening...
                Color.black
                    .opacity(0.7)
                    .blur(radius: 200)
                    .ignoresSafeArea()
 
                Circle()
                    .fill(Color("Purple"))
                    .padding(50)
                    .blur(radius: 120)
                //Moving Top...
                    .offset(x: -size.width / 1.8, y: size.height / 5)
                
                Circle()
                    .fill(Color("LightBlue"))
                    .padding(50)
                    .blur(radius: 150)
                //Moving Top...
                    .offset(x: size.width / 1.8, y: -size.height / 2)
                
                
                Circle()
                    .fill(Color("LightBlue"))
                    .padding(50)
                    .blur(radius: 90)
                //Moving Top...
                    .offset(x: size.width / 1.8, y: size.height / 2)
                
                //Adding Purple on both bottom ends...
                Circle()
                    .fill(Color("Purple"))
                    .padding(100)
                    .blur(radius: 110)
                //Moving Top...
                    .offset(x: size.width / 1.8, y: size.height / 2)
                
                Circle()
                    .fill(Color("Purple"))
                    .padding(100)
                    .blur(radius: 110)
                //Moving Top...
                    .offset(x: -size.width / 1.8, y: size.height / 2)
                
            }
            
            //Content...
            VStack {
                
                Spacer(minLength: 10)
                
                ZStack {
                    
                    //Background balls...
                    Circle()
                        .fill(Color("Purple"))
                        .frame(width: 100, height: 100)
                        .blur(radius: 10)
                        .offset(x: 120, y: -80)
                    
                    Circle()
                        .fill(Color("LightBlue"))
                        .frame(width: 100, height: 100)
                        .blur(radius: 40)
                        .offset(x: -120, y: 80)
                    
                    //GlassMorphism Card...
                    GlassMorphicCardView()
                }
                
                Spacer(minLength: 10)
                
                Text("Know Everyhing\nabout the weather")
                    .font(.system(size: 40, weight: .bold))
                    
                
                Text(getAttributedString())
                    .padding(.top)
                    .fontWeight(.semibold)
                    .kerning(1.1)
                
                Button {
                    
                } label: {
                    Text("Get start")
                        .font(.title3.bold())
                        .padding(.vertical, 22)
                        .frame(maxWidth: .infinity)
                        .background(
                            .linearGradient(
                                .init(colors: [ Color("Button11"), Color("Button12")]
                                     ),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            , in: RoundedRectangle(cornerRadius: 20)
                        )
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 20)
                
                Button {
                    
                } label: {
                    Text("Already have a acconut")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }


            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
        }
    }
    
    //going to use AttributesString from IOS 15...
    func getAttributedString() -> AttributedString {
        var attStr = AttributedString("Start now and learn more abour\nlocal weather instantly")
        attStr.foregroundColor = .gray
        
        //convert only 'local weather...'
        if let range = attStr.range(of: "local weather") {
            attStr[range].foregroundColor = .white
        }
        
        return attStr
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
