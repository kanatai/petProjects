//
//  CharactersListState.swift
//  FluxExample
//
//  Created by admin on 21/2/23.
//

import Foundation

struct CharactersListState: Equatable {
    
    var isLoading = false
    var characters: [MortyCharacter] = []
}
