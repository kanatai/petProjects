//
//  MainView.swift
//  ApiAsyncAwait
//
//  Created by admin on 15/5/23.
//

import SwiftUI
import UIKit

struct MainView: View {
    @State private var quotes = [String]()
    
    init() {
    }
    
    var body: some View {
        NavigationView {
            List(quotes, id: \.self) { item in
                VStack(alignment: .leading) {
                    Text(item)
                        .font(.headline)
                        .foregroundColor(Color("skyBlue"))
                    Text(item)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Quotes")
            .task {
                await fetchData()
            }
        }
    }
    
    func fetchData() async {
        //MARK: Create URL
        guard let url = URL(string: "https://api.chucknorris.io/jokes/categories") else { print("This Url does not work")
            return
        }
        
        //MARK: Fetch data from that URL
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            //MARK: Decode data
            if let decode = try? JSONDecoder().decode([String].self, from: data) {
                quotes = decode
            }
                
        } catch {
            print("Data is not valid!")
        }
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
