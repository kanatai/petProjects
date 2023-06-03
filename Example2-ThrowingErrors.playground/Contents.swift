import UIKit

// url = "https://jsonplaceholder.typicode.com/posts"
struct Post: Decodable {
    let title: String
    let body: String
}

enum NetworkError: Error {
    case badUrl
    case decodingError
    case badRequest
    case noData
    case customError(Error)
}

func getPost(complaction: @escaping (Result<[Post], NetworkError>) -> Void) {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        complaction(.failure(.badUrl))
        return
    }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            complaction(.failure(.customError(error)))
        } else if (response as? HTTPURLResponse)?.statusCode != 200 {
            complaction(.failure(.badRequest))
        } else {
            guard let data = data else {
                complaction(.failure(.noData))
                return
            }

            let posts = try? JSONDecoder().decode([Post].self, from: data)
            if let posts = posts {
                complaction(.success(posts))
            } else {
                complaction(.failure(.decodingError))
            }
        }
    }.resume()
}

getPost { (result) in
    switch result {
    case .success(let posts):
        print(posts)
    case .failure(let error):
        print(error)
    }
}

//var list = [124,43,78,12,865,12,243,8,54,2,5,9,341,65,3,1]
//
//var sortedList = list.sorted { first, second in
//    first > second
//}
//print(sortedList)
//print(list.reduce(0, +))

