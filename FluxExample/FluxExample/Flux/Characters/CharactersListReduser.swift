//
//  CharactersListReduser.swift
//  FluxExample
//
//  Created by admin on 21/2/23.
//

import Foundation
import ComposableArchitecture

let charactersListReduser = Reducer<
    CharactersListState,
    CharactersListActions,
    CharactersListEnviroment> { state, action, env in
        
        switch action {
        case .getAllCharacters:
            state.isLoading = true
            return .task {
                return await .getCharactersResult(TaskResult {
                    try await env.getAllCharacters()
                })
            }
            
        case let .getCharactersResult(.success(loadedData)):
            state.isLoading = false
            state.characters = loadedData
            print("✅✅✅ success ✅✅✅: \(loadedData)")
            return .none
            
        case let .getCharactersResult(.failure(errorData)):
            state.isLoading = false
            print("🚫🚫🚫 error 🚫🚫🚫: \(errorData)")
            return .none
        }
}
