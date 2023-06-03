//
//  Home.swift
//  MusicAlbum
//
//  Created by admin on 12/5/23.
//

import SwiftUI

struct Home: View {
    // MARK: Album
    @State var albums: [Album] = sampleAlbums
    
    // MARK: Custom scroller properties
    @State var currentIndex: Int = 0
    @State var currentAlbum: Album = sampleAlbums.first!
    
    var body: some View {
        VStack(spacing: 0) {
            Text(titleString)
                .font(.largeTitle)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .padding(.bottom, 40)
            
            // MARK: Custom scroller
            VStack {
                AlbumArtworkScroller()
                    .zIndex(1)
                standView
                    .zIndex(0)
            }
            .padding(.horizontal, -15)
            .zIndex(1)
            
            // MARK: Page TabView
            TabView {
                ForEach($albums) { $album in
                    AlbumCardView(album: album)
                        .offsetX { value, width in
                            if currentIndex == getIndex(album: album) {
                                // MARK: Updating offset
                                // Converting offset to 80
                                //Disk will goes inside when doing swipe on both sides
                                var offset = ((value > 0 ? -value : value) / width) * 80
                                offset = -offset < 80 ? offset : -80
                                album.diskOffset = offset
                            }
                            
                            // MARK: Updating card when the card is released
                            if value == 0 && currentIndex != getIndex(album: album) {
                                album.diskOffset = 0
                                withAnimation(.easeInOut(duration: 0.6)) {
                                    albums[currentIndex].showDisk = false
                                    currentIndex = getIndex(album: album)
                                    currentAlbum = albums[currentIndex]
                                    
                                }
                                
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 1, blendDuration: 1).delay(0.4)) {
                                    albums[currentIndex].showDisk = true
                                }
                            }
                        }
                }
            }
            .padding(.horizontal, -15)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .zIndex(0)
        }
        .padding(15)
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .top)
        .background(Color("BackgroundColor"),
                    ignoresSafeAreaEdges: .all)
        .onAppear {
            // Showing Disk for first card
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 1, blendDuration: 1).delay(0.4)) {
                albums[currentIndex].showDisk = true
            }
        }
        
    }
    
    // MARK: Album Index
    func getIndex(album: Album) -> Int {
        return albums.firstIndex { _album in
            return _album.id == album.id
        } ?? 0
    }
    
    // MARK: Album CardView for page tab
    @ViewBuilder
    func AlbumCardView(album: Album) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .top, spacing: 0) {
                 Text("Album")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray.opacity(0.6))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 5) {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .font(.system(size: 8))
                            .foregroundColor(.gray.opacity(index > album.rating ? 0.2 : 1))
                    }
                    
                    Text("\(album.rating).0")
                        .font(.caption)
                        .padding(.leading, 5)
                }
                
            }
            
            Text(album.albumName)
                .font(.title.bold())
            
            Label {
                Text("Ariana Grande")
            } icon: {
                Text("By").foregroundColor(.gray.opacity(0.7))
            }
            .padding(.top, 12)

            Text(sampleText)
                .foregroundColor(.gray.opacity(0.7))
                .padding(.top, 10)
            
            // MARK: Sample tags
            HStack(spacing: 10) {
                ForEach(["Punk", "Classic Rock", "Art Rock"], id: \.self) { tag in
                    Toggle(tag, isOn: .constant(false))
                        .toggleStyle(.button)
                        .buttonStyle(.bordered)
                        .tint(.gray)
                        .font(.caption)
                    
                }
            }
            .padding(.top)
        }
        .padding(.top, 25)
        .padding([.horizontal, .bottom])
        .background {
            CustomCorners(corners: [.bottomLeft, .bottomRight], radius: 25)
                .fill(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 20)
    }
//
//Задача: a=[1,2,5,7,9], k=5, return 2; k=11, return -1
//
//let a = [1,2,5,7,9]
//let k = 5
//let mid = a.mid()
//
//for item in a {
//let list = []
//if mid > k {
//     for i in 0..<
//    if k == item
//}
//}

    
    // MARK: Custom scroller animation view
    // Why using @ViewBuilder here
    // Since It will update to @State updates
    @ViewBuilder
    func AlbumArtworkScroller() -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            LazyHStack(spacing: 0) {
                ForEach($albums) { $album in
                    HStack(spacing: 0) {
                        Image(album.albumImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 170, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 8,
                                                        style: .continuous))
                            .shadow(color: .black.opacity(0.1),
                                    radius: 5, x: 0, y: 10)
                            .zIndex(1)
                        
                        Image("disk")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160, height: 180)
                            
                            // MARK: Album image at center
                            .overlay {
                                Image(album.albumImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }
                            .rotationEffect(.init(degrees: album.showDisk ? 0 : 40))
                            .offset(x: album.showDisk ? 80 : 0)
                            .offset(x: album.showDisk ? album.diskOffset : 0)
                            .scaleEffect(album.showDisk ? 1 : 0.1)
                            .padding(.leading, -170)
                            .zIndex(0)
                         
                    }
                    .offset(x: -35)
                    .frame(width: size.width)
                }
            }
            .offset(x: CGFloat(currentIndex) * -size.width)
        }
        .frame(height: 180)
    }
    
    // MARK: Custom View like Wooden Board
    var standView: some View {
        Rectangle()
            .fill(.white.opacity(0.6))
            .shadow(color: .black.opacity(0.85),
                    radius: 20,
                    x: 0, y: 5)
            .frame(height: 10)
            .overlay(alignment: .top) {
                Rectangle()
                    .fill(.white.opacity(0.75).gradient)
                    .frame(height: 385)
                    // MARK: 3D Rotaion
                    .rotation3DEffect(.init(degrees: -98),
                                      axis: (x: 1, y: 0, z: 0),
                                      anchor: .top,
                                      anchorZ: 0.5,
                                      perspective: 1)
                    .shadow(color: .black.opacity(0.08), radius: 25, x: 0, y: 5)
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 15)
            }
            .scaleEffect(1.2)
        
    }
    
    // MARK: Attributed String
    var titleString: AttributedString {
        var attString = AttributedString(stringLiteral: "My Library")
        if let range = attString.range(of: "Library") {
            attString[range].font = .largeTitle.bold()
        }
        return attString
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// MARK: Custom Extension for finding horizontal offset

extension View {
    func offsetX(complaction: @escaping (CGFloat, CGFloat) -> ()) -> some View {
        self.overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: OffsetXkey.self, value: proxy.frame(in: .global).minX)
                    .onPreferenceChange(OffsetXkey.self) { value in
                        complaction(value, proxy.size.width)
                    }
            }
        }
    }
}


