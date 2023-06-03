//
//  MovieModel.swift
//  SwiftUIAnimateCarusel
//
//  Created by admin on 28/5/23.
//

import Foundation

struct Movie: Identifiable, Equatable {
    var id = UUID().uuidString
    var movieTitle: String
    var artWork: String
}

var movies: [Movie] = [
    Movie(movieTitle: "Джон Уик 4", artWork: "movie0"),
    Movie(movieTitle: "Переводчик", artWork: "movie1"),
    Movie(movieTitle: "Вызов", artWork: "movie2"),
    Movie(movieTitle: "Стражи Галактики 3", artWork: "movie3"),
    Movie(movieTitle: "Подземелья и драконы", artWork: "movie4"),
    Movie(movieTitle: "Марио", artWork: "movie5"),
    Movie(movieTitle: "НЕИЗМЕННЫЙ", artWork: "movie6")
]
