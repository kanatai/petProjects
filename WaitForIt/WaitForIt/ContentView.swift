//
//  ContentView.swift
//  WaitForIt
//
//  Created by admin on 31/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var jokeService = JokeService()
    
    var body: some View {
//        VStack {
//            VStack {
//                Image(systemName: "globe")
//                Text("Hello, world!")
//            }
//            .foregroundStyle (
//                LinearGradient(colors: [.teal, .indigo, .yellow], startPoint: .top, endPoint: .bottom)
//            )
//
//            VStack {
//                Text("The event is on \(Text("Subday").foregroundColor(.teal))")
//                Text("Visit our [website](https://google.com)")
//            }
//        }
        
        
        VStack {
            Text(jokeService.joke)
                  .multilineTextAlignment(.center)
                  .padding(.horizontal)
        }
        
        VStack {
            Spacer()
            Button {
                Task {
                    try await jokeService.fetchJoke()
                }
            } label: {
              Text("Fetch a joke")
                .padding(.bottom)
//                .opacity($jokeService.isFetching ? 0 : 1)
//                .overlay {
//                  if jokeService.isFetching { ProgressView() }
//                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
