//
//  TopView.swift
//  TestTraderProject
//
//  Created by admin on 20/5/23.
//

import SwiftUI

struct TopView: View {
    
    @ObservedObject var viewModel: TopViewModel = TopViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(viewModel.tops.indices, id: \.self){ index in
                        if index == 0 {
                            HeaderView()
                                .listRowBackground(Color("cell_light_color"))
                        } else {
                            TopCellView(top: $viewModel.tops[index], tops: $viewModel.tops)
                                .frame(height: 36.6)
                                .listRowBackground(index % 2 == 0 ? Color("cell_light_color") : Color.clear)
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .background(Color.clear)
                .scrollContentBackground(.hidden)
                .onReceive(viewModel.timer) { output in
                    viewModel.makeIncreaseTheRangeTops()
                }
            }
            .background(Color("bg_second_color"),
                        ignoresSafeAreaEdges: .all)
            .preferredColorScheme(.light)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(Color("tabbar_bg_color"), for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    CustomTitleNV(title: .constant("Top"))
                }
            }
            .onAppear {
                viewModel.makeIncreaseTheRangeTops()
            }
        }
    }
}


struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
            .previewDevice("iPhone SE (3rd generation)")
        
        TopView()
            .previewDevice("iPhone 14 Pro")
        
        TopView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
