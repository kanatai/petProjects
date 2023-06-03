//
//  ContentView.swift
//  LocalizeApp
//
//  Created by admin on 12/5/23.
//

import SwiftUI

enum Labels: String, CaseIterable {
    case forgotPassword = "forgot"
    case resetPassword = "reset"
    
    func locolizeString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

struct ContentView: View {
    
    @State var login = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Text("authenticate")
                    .font(.title)
                    .fontWeight(.black)
                                
                VStack {
                    VStack(alignment: .leading,
                           spacing: 5
                    ) {
                        Text("login").fontWeight(.black)
                        TextField("", text: $login)
                            .padding(5)
                            .background(.white)
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading,
                           spacing: 5
                    ) {
                        Text("password").fontWeight(.black)
                        
                        SecureField("", text: $password)
                            .padding(5)
                            .background(.white)
                            .cornerRadius(8)

                    }
                    
                }
                .padding()
                .padding(.bottom, 20)
                .background(.brown)
                .cornerRadius(20)
                .shadow(color: .yellow, radius: 6)
                
                Button {
                    
                } label: {
                    Text("signIn")
                        .foregroundColor(.brown)
                        .fontWeight(.medium)
                }
                
                HStack {
                    ForEach(Labels.allCases, id: \.self) { item in
                        Text(item.locolizeString())
                    }
                }
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
