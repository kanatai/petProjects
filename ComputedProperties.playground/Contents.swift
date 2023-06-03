import UIKit

struct CartItem {
    var name: String
    var price: Double
}

struct Cart {
    var items: [CartItem]
    var total: Double {
        items.reduce(0) {
            return $0 + $1.price
        }
    }
}

let items = [CartItem(name: "Bread", price: 4.50), CartItem(name: "Milk", price: 3.50), CartItem(name: "Pizza", price: 10.95)]

let cart = Cart(items: items)
print(cart.total)


/*
struct Workout {
    var startTime: Date
    var endTime: Date
    
    var timeElapsed: TimeInterval {
        endTime.timeIntervalSince(startTime)
        ///#timeIntervalSince вычисление между двумя датами
    }
}

let start = Date()
sleep(5)
let end = Date()

let workout = Workout(startTime: start, endTime: end)

print(workout.timeElapsed)

*/
