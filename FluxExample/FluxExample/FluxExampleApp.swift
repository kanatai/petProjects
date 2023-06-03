//
//  FluxExampleApp.swift
//  FluxExample
//
//  Created by admin on 21/2/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct FluxExampleApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersListView(
                stateStore:Store<CharactersListState, CharactersListActions> (initialState: CharactersListState(),
                                                                       reducer: charactersListReduser,
                                                                       environment: CharactersListEnviroment())
            )
        }
    }
}
