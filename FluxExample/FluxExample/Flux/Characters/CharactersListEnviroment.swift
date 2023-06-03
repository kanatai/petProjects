//
//  CharactersListEnviroment.swift
//  FluxExample
//
//  Created by admin on 21/2/23.
//

import Foundation

struct CharactersListEnviroment {
    let network = MyRequestController()
    
    func getAllCharacters() async throws -> [MortyCharacter] {
        return await network.sendRequest().results!
            .map({ networkCharecters in
                MortyCharacter(id: networkCharecters.id , name: networkCharecters.name )
            })
    }
}
