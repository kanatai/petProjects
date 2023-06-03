//
//  HistoryView.swift
//  WebBrowser
//
//  Created by admin on 18/5/23.
//

import SwiftUI
import RealmSwift

struct HistoryView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedResults(HistoryRealmModel.self) var histories
    
    var callback: ((String) -> ())
    
    init(callback: @escaping ((String) -> ())) {
        self.callback = callback
    }
    
    var body: some View {
        List() {
            ForEach(histories) { item in
                VStack(alignment: .leading, spacing: 2) {
                    Text(item.name)
                        .foregroundColor(.black)
                        .font(.body)
                        .lineLimit(3)

                    Text(item.created)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                .onTapGesture {
                    mode.wrappedValue.dismiss()
                    callback(item.name)
                }
            }.onDelete(perform: $histories.remove )
        }
        .navigationTitle("History")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView { url in }
    }
}
