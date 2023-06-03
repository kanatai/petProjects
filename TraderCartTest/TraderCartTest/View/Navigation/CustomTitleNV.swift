//
//  CustomTitleNV.swift
//  TraderCartTest
//
//  Created by admin on 17/5/23.
//

import SwiftUI

struct CustomTitleNV: View {
    
    @Binding var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
                .font(Font.custom("Inter-Bold", size: 22))
        }
        .frame(maxWidth: .infinity, maxHeight: 66.0)
        .background(Color.clear)
        
    }
}

//struct CustomTitleNV_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTitleNV(title: .constant("Trade"))
//    }
//}
