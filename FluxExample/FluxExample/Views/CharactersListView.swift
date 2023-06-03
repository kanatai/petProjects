//
//  CharactersListView.swift
//  FluxExample
//
//  Created by admin on 21/2/23.
//

import SwiftUI
import ComposableArchitecture

struct CharactersListView: View {
    let stateStore: Store<CharactersListState, CharactersListActions>
    
    var body: some View {
        WithViewStore(stateStore) { viewStore in
            GeometryReader { geom in
                List {
                    ForEach(viewStore.characters) { character in
                        
                        Text("Name: \(character.name ?? "")")
                        
                    }
                }
            }
            .onAppear {
                viewStore.send(.getAllCharacters)
            }
        }
    }
}

