import UIKit

//struct Item {
//    var name: String
//    var price: Double
//}
//
//struct Cart {
//    private(set) var items: [Item] = []
//
//    mutating func addItem(_ item: Item) {
//        items.append(item)
//    }
//
//    var total: Double {
//        items.reduce(0) { (value, item) -> Double in
//            value + item.price
//        }
//    }
//}
//
//var cart: Cart = Cart()
//cart.addItem(Item(name: "Milk", price: 4.50))
//cart.addItem(Item(name: "Bread", price: 2.50))
//cart.addItem(Item(name: "Eggs", price: 12.50))
//
//print(cart.total)

//let items = [2.5, 1.0, 5.1, 3.1, 1.6]
//let total = items.reduce(0, +)
//print(total)

//TODO: REDUCE INTO
//Remember into and inout is very important things
/*
 inout - it make change list result at parameters
 */
let ratings = [4, 8.5, 9.5, 2, 6, 3, 5.5, 7, 2.8, 9.8, 5.9, 1.5]

let results = ratings.reduce(into: [:]) { (results: inout [String:Int], rating: Double) in
    
    switch rating {
        case 1..<4: results["Vary bad", default: 0] += 1
        case 4..<6: results["Ok", default: 0] += 1
        case 6..<8: results["Good", default: 0] += 1
        case 8..<11: results["Excellent", default: 0] += 1
        default: break
    }
}

print(results)

