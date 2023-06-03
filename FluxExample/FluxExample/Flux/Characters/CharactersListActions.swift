//
//  CharactersListActions.swift
//  FluxExample
//
//  Created by admin on 21/2/23.
//

import Foundation
import ComposableArchitecture

enum CharactersListActions {
    case getAllCharacters
    case getCharactersResult(TaskResult<[MortyCharacter]>)
}
