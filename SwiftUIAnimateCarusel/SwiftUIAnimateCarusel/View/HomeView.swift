//
//  HomeView.swift
//  SwiftUIAnimateCarusel
//
//  Created by admin on 28/5/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var currentTab: TabModel = .home
    @Namespace var animation
    
    //MARK: Carusel proporties
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack {
            HeaderView()
            
            SearchBar()
            
            (Text("Featured")
                .fontWeight(.semibold) +
             Text(" Movies")
            )
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 15)
            
            CustomCaruselView(index: $currentIndex, items: movies, cardPadding: 150, id: \.id) { movie, cardSize in
                //MARK OUR Custom cell view
                Image(movie.artWork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardSize.width, height: cardSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                
            }
            .padding(.horizontal, -15)
            .padding(.vertical)
            
            Tabbar()
        }
        .padding([.horizontal, .top], 15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background {
            GeometryReader { proxy in
                TabView(selection: $currentIndex) {
                    ForEach(movies.indices, id: \.self) { index in
                        Image(movies[index].artWork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width,
                                   height: proxy.size.height)
                            .clipped()
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeOut, value: currentIndex)
                
                Rectangle()
                    .fill(.ultraThinMaterial)
                
                LinearGradient(
                    colors: [
                        .clear, Color("BGTop"), Color("BGBottom")],
                    startPoint: .top,
                    endPoint: .bottom)
                .ignoresSafeArea()
            }
        }
        
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                (Text("Hello,") +
                 Text(" I am Kanatbek")
                )
                .font(.title2)
                
                Text("Book your favourite movie")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                
            } label: {
                Image("ic_jenifer")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }

        }
    }
    
    @ViewBuilder
    func SearchBar() -> some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
                .foregroundColor(.gray)
            
            TextField("Search", text: .constant(""))
                .padding(.vertical, 10)
            
            Image(systemName: "mic")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white.opacity(0.12))
        }
        .padding(.top, 12)
    }
    
    @ViewBuilder
    func Tabbar() -> some View {
        HStack(spacing: 0) {
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                VStack(spacing: -2) {
                    Image(systemName: tab.rawValue)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 28)
                        .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.6))
                    
                    if currentTab == tab {
                        Circle()
                            .fill(.white)
                            .frame(width: 5, height: 5)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeOut) {
                        currentTab = tab
                    }
                }
                
                
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
