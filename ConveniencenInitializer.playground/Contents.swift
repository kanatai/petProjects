import UIKit


//class Foo: NSObject {
//    let bar: String = "bar"
//}
//let foo = Foo()
//print("used print")
//print(foo)
//// <SwiftRocks.Foo: 0x1030b9250>
//print("used dump")
//dump(foo)

//удобные инициализаторы
class Car {

    var make: String
    var model: String
    var color: String

    init(make: String, model: String, color: String) {
        self.make = make
        self.model = model
        self.color = color
    }

    convenience init(make: String, model: String) {
        self.init(make: make, model: model, color: "White")
    }
}

var car = Car(make: "Honda", model: "Accord")
