import UIKit

//Unwrapping Techniques

//в основном этот курс назначен на темы такие как главное optional values, и проверками на чтения if let, guard let

//Understanding if-let Variable Unwrapping

struct Student: CustomStringConvertible {
    var description: String {
        let studentDescription = "\(firstName)"
        return studentDescription
    }
    
    let firstName: String
    let lastName: String
    let middleName: String?
    var grade: String?
}

let student = Student(firstName: "John", lastName: "Doe", middleName: "Smith", grade: "A")
print(student)

guard let url = URL(string: "aa bb cc") else {
    fatalError("URL is not defined!")
}

print(url)

