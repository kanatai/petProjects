import UIKit

struct Student {
    let firstName: String
    let lastName: String
    let grade: String
}

extension Student {
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.grade = ""
    }
}

let student = Student(firstName: "John", lastName: "Doe")
let student2 = Student(firstName: "John", lastName: "Doe", grade: "12")