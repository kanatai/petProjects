//
//  JokeService.swift
//  WaitForIt
//
//  Created by Kanatbek Torogeldiev on 23/12/22.
//

import Foundation

private actor JokeServiceStore {
    func load() async throws -> String {
        let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
        let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data)
        return decodedResponse?.value ?? ""
    }
}
class JokeService: ObservableObject {
    @Published private(set) var joke = "Joke appears here"
    private let store = JokeServiceStore()
    public init() { }
}
extension JokeService {
    @MainActor
    func fetchJoke() async throws {
        joke = try await store.load()
    }
}
struct Joke: Codable {
    let value: String
}
