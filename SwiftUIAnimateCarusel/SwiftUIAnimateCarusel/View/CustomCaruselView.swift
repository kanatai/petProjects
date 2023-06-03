//
//  CustomCaruselView.swift
//  SwiftUIAnimateCarusel
//
//  Created by admin on 29/5/23.
//

import SwiftUI

struct CustomCaruselView<Content: View, Item, ID>: View where Item: RandomAccessCollection, ID: Hashable, Item.Element: Equatable {
    
    var content: (Item.Element, CGSize) -> Content
    var id: KeyPath<Item.Element, ID>
    
    //MARK: View proporties
    var spacing: CGFloat
    var cardPadding: CGFloat
    var items: Item
    @Binding var index: Int
    
    //MARK: Gesture properties
    @GestureState var translation: CGFloat = 0
    @State var offset: CGFloat = 0
    @State var lastSortedffset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    //MARK: Rotation
    @State var rotation: Double = 0.0
    
    init(index: Binding<Int>,
         items: Item,
         spacing: CGFloat = 30,
         cardPadding: CGFloat = 80,
         id: KeyPath<Item.Element, ID>,
         @ViewBuilder content: @escaping (Item.Element, CGSize) -> Content
    ) {
        self.content = content
        self.id = id
        self._index = index
        self.spacing = spacing
        self.cardPadding = cardPadding
        self.items = items
    }
    
    var body: some View {
        GeometryReader { proxy in
            
            let size = proxy.size
            let cardWidth = size.width - (cardPadding - spacing)
            
            LazyHStack(spacing: spacing) {
                ForEach(items, id: id) { movie in
                    
                    //Since we already applied padding
                    //and again we are adding it to frame
                    //so simply removing the spacing
                    
                    let index = indexOf(item: movie)
                    
                    content(movie, CGSize(width: size.width - cardPadding, height: size.height))
                        //MARK: Rotation Each View 5 deg multiplied with it's index
                        //And while scrolling setting it to 0, thus it will give some nice Circular
                        .rotationEffect(.init(degrees: Double(index) * 5), anchor: .bottom)
                        .rotationEffect(.init(degrees: rotation), anchor: .bottom)
                        //Applay after rotation, thus you will get smooth effect
                        .offset(y: offsetY(index: index, cardWidth: cardWidth))
                        .frame(width: size.width - cardPadding, height: size.height)
                        .clipShape(Rectangle())
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: limitScroll())
            .contentShape(Rectangle())
            .gesture (
                DragGesture(minimumDistance: 5)
                    .updating($translation, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onChanged {
                        onChanged(value: $0, cardWidth: cardWidth)
                    }
                    .onEnded {
                        onEnd(value: $0, cardWidth: cardWidth)
                    }
            )
        }
        .padding(.top, 60)
        .onAppear {
            let extraSpace = (cardPadding / 2) - spacing
            offset = extraSpace
            lastSortedffset = extraSpace
        }
        .animation(.easeOut, value: translation == 0)
    }
    
    func onChanged(value: DragGesture.Value, cardWidth: CGFloat) {
        let translationX = value.translation.width
        offset = translationX + lastSortedffset
        
        //MARK: Calculating rotation
        let progress = offset / cardWidth
        rotation = progress * 5
    }
    
    func onEnd(value: DragGesture.Value, cardWidth: CGFloat) {
        //finding current index
        var _index = (offset / cardWidth).rounded()
        _index = max(-CGFloat(items.count - 1), _index)
        _index = min(_index, 0)
        currentIndex = Int(_index)
        
        //MARK: Updating index
        //Note: Since we're moving on right side
        //so all data will be negative
        index = -currentIndex
        withAnimation(.easeOut(duration: 0.25)) {
            
            //Remuving extra space
            //reaseon div to 2 (/2) becouse we need both sides need to be visible
            let extraSpace = (cardPadding / 2) - spacing
            offset = (cardWidth * _index) + extraSpace
            
            //MARK: Calculating rotation
            let progress = offset / cardWidth
            
            //Since index starts wifth zero
            rotation = (progress * 5).rounded() - 1
        }
        lastSortedffset = offset
    }
    
    //Limiting Scroll on first and last item
    func limitScroll() -> CGFloat {
        let extraSpace = (cardPadding / 2) - spacing
        if index == 0 && offset > extraSpace {
            return extraSpace + (offset / 4)
        } else if index == items.count - 1 && translation < 0 {
            return offset - (translation / 2)
        } else {
            return offset
        }
    }
    
    //Item index
    func indexOf(item: Item.Element) -> Int {
        let array = Array(items)
        if let index = array.firstIndex(of: item) {
            return index
        }
        return 0
    }
    
    //Moving current item up
    func offsetY(index: Int, cardWidth: CGFloat) -> CGFloat {
        //We are converting the current translation, not whole offset
        //that is why created @GestureStateto hold the current translation data
        
        //Converting translation to -60...60
        let progres = ((translation < 0 ? translation : -translation) / cardWidth) * 60
        let yOffset = -progres < 60 ? progres : -(progres + 120)
        
        //Checking previous, next and In-Between offsets
        let previous = (index - 1) == self.index ? (translation < 0 ? yOffset : -yOffset) : 0
        let next = (index + 1) == self.index ? (translation < 0 ? -yOffset : yOffset) : 0
        
        let In_Between = (index - 1) == self.index ? previous : next
        
        return index == self.index ? -60 - yOffset : In_Between
    }
}

struct CustomCaruselView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
