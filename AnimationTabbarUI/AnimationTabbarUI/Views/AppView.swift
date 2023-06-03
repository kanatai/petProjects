//
//  AppView.swift
//  AnimationTabbarUI
//
//  Created by admin on 12/5/22.
//

import SwiftUI

struct TabModel: Hashable {
    var title: String
    var image: String
}

struct AppView: View {
    
    @State private var selectTabItem = "Home"
    
    var tabs = [
        TabModel(title: "Home", image: "house"),
        TabModel(title: "Blog", image: "newspaper"),
        TabModel(title: "Message", image: "message"),
        TabModel(title: "Profile", image: "person")
    ]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectTabItem) {
                HomeView().tag("Home")
                Text("").tag("Blog")
                Text("").tag("Message")
                Text("").tag("Profile")
            }
            
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    Spacer(minLength: 10)
                    CustomTabbarItem(model: tab,
                                     selectedTab: $selectTabItem)
                    .shadow(color: selectTabItem == tab.title ? .secondary.opacity(0.7) : .clear,
                            radius: 3)
                    Spacer(minLength: 10)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 20)
            .padding(.bottom, 5)
            .background(Color("gray"))
            
        }
    }
  
}


struct CustomTabbarItem: View {
    @Binding var selectedTab: String
    var model: TabModel
//    var complaction: (String) -> ()
    
    init(model: TabModel,
         selectedTab: Binding<String>
//         complaction: @escaping (String) -> ()
    ) {
        self._selectedTab = selectedTab
        self.model = model
//        self.complaction = complaction
    }
    
    var body: some View {
        if model.title == "Profile" {
            profileView
        } else {
            ZStack {
                Button {
                    withAnimation(.spring()) {
                        selectedTab = model.title
                    }
                } label: {
                    HStack {
                        Image(systemName: model.image)
                            .resizable()
                            .frame(width: 20,
                                   height: 20)
                            .foregroundColor(Color.black)
                        if selectedTab == model.title {
                            Text(model.title)
                                .font(.system(size: 14.0))
                                .foregroundColor(Color.black)
                        
                        }
                    }
                }
                .opacity(selectedTab == model.title ? 1.0 : 0.7)
                .padding(.vertical, 10)
                .padding(.horizontal, 17)
                .background(selectedTab == model.title ?  .white : Color("gray"))
                .clipShape(Capsule())
            }
        }
    }
    
    var profileView: some View {
        Button {
            withAnimation(.spring()) {
                selectedTab = model.title
            }
        } label: {
            ZStack {
                Circle()
                    .frame(width: 36, height: 36)
                    .foregroundColor(selectedTab == model.title ? Color("green") : .white)
                
                Image("ic_jenifer")
                    .resizable()
                    .cornerRadius(16)
                    .frame(width: 32, height: 32)
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
