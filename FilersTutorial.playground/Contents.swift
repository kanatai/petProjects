import UIKit

/*var names = ["Kanat", "Murat", "Makhabat", "Amir", "Asel"]

let finalNames = names.filter { name in
    return name.count > 4
}

print(finalNames)*/

struct Movie {
    let title: String
    let genre: String
}

var movies = [
    Movie(title: "Lord of the rings", genre: "Fiction"),
    Movie(title: "ET", genre: "Fiction"),
    Movie(title: "Finding nemo", genre: "Kids"),
    Movie(title: "Cars", genre: "Kids"),
]

//let kidMovies = movies.filter { movie in
//    return movie.genre == "Kids"
//}
//
//print(kidMovies)

let muvieToRemove = Movie(title: "Finding nemo", genre: "Kids")

movies = movies.filter { movie in
    return movie.title != muvieToRemove.title
}

print(movies)
