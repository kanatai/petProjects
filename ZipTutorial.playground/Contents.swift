import UIKit

var students = ["Alex", "Mary", "John", "Steven", "Klara"]
var grades = [3.4, 2.8, 3.8, 4.0, 6.8]

let pair = zip(students, grades)

for studentsAndGrades in pair {
    print(studentsAndGrades.0)
    print(studentsAndGrades.1)
}
