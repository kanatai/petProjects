//
//  TitleText.swift
//  TestTraderProject
//
//  Created by admin on 22/5/23.
//

import SwiftUI

struct TitleText: View {
        
    @Binding var title: String
    private var size: CGFloat = 12.0
    private var foregroundColor: Color = Color("text_color")
    
    init(title: String,
         size: CGFloat = 12,
         fc: Color = Color("text_color")
    ) {
        _title = .constant(title)
        self.size = size
        foregroundColor = fc
    }
    
    var body: some View {
        Text(title)
            .foregroundColor(foregroundColor)
            .font(Font.custom("Inter-Medium", size: size))
    }
}
