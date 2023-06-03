import UIKit

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

movies.forEach { movie in
    addToFavorite(movie)
}

func addToFavorite(_ movie: Movie) {
    
}

//JUST OBJECs ForEach
//movies.forEach { movie in
//    print(movie.title)
//}

//With Index and OBJECs ForEach
movies.enumerated().forEach { (index, movie) in
    print("Movie at \(index) has a title \(movie.title)")
}
