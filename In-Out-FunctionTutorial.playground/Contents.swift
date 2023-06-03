import UIKit

// In-Out Parameters

struct User {
    var userId: Int?
    var name: String
}

func saveUser(_ user: inout User) {
    //code to save the user
    user.userId = 100
}

var user = User(name: "John Doe")

saveUser(&user)

print(user)
