import UIKit
//наблюдатели за недвижимостью
struct Website {
    
    init(url: String) {
        defer { self.url = url }
        self.url = url
    }
    
    var url: String {
//        willSet {}
        
        didSet {
            url = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? url
        }
    }
}

var website = Website(url: "www.movies.com/?search=Lord of the Rings")
//website.url = "www.movies.com/?search=Lord of the Rings"
print(website)
