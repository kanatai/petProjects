//
//  ResponseModels.swift
//  FluxExample
//
//  Created by admin on 21/2/23.
//

import Foundation

struct Characters: Codable {
    let info: Info?
    let results: [Result]?
}

struct Info: Codable {
    let count, page: Int?
    let next: String?
    let prev: String?
}

struct Result: Codable {
    let id: Int?
    let name: String?
}
