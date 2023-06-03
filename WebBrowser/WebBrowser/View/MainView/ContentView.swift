//
//  ContentView.swift
//  WebBrowser
//
//  Created by admin on 16/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: WBViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Введите имя веб-сайта",
                              text: $model.urlString)
                        .textFieldStyle(.roundedBorder)
                        .padding(.trailing, 10)
                        .textCase(.lowercase)
                        .keyboardType(.URL)
                    
                    Button {
                        model.loadUrl()
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                        }
                        .frame(width: 30, height: 30)
                        .background(.cyan)
                        .cornerRadius(15)
                    }
                    .disabled(model.urlString.isEmpty)
                }
                
                WebView(webView: model.webView) { currentUrl in
                    print("current page is : \(currentUrl)")
                    if !currentUrl.contains("about:blank") {
                        model.urlString = currentUrl
                        model.saveToHistory()
                    }
                }
                
                HStack {
                    NavigationLink {
                        HistoryView { url in
                            model.urlString = url
                            model.loadUrl()
                        }
                    } label: {
                        Image(systemName: "book.circle.fill")
                            .resizable()
                            .foregroundColor(.cyan)
                            .frame(width: 30, height: 30)
                    }
                    
                    Spacer()
                    
                    Button {
                        model.back()
                    } label: {
                        Image(systemName: "arrow.backward.circle.fill")
                            .resizable()
                            .foregroundColor(.cyan)
                            .frame(width: 30, height: 30)
                    }
                    
                    Button {
                        model.forward()
                    } label: {
                        Image(systemName: "arrow.forward.circle.fill")
                            .resizable()
                            .foregroundColor(.cyan)
                            .frame(width: 30, height: 30)
                    }
                }
                .background(.white)
            }
            .ignoresSafeArea(.all)
            .padding()
        }
        .ignoresSafeArea(.all)
        .onAppear {
            if let item = model.histories.last {
                model.urlString = item.name 
                model.loadUrl()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WBViewModel())
    }
}
