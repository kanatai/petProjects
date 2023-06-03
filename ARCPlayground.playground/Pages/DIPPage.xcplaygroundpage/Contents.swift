//: [Previous](@previous)

import Foundation

class Order {
    var orderId: Int
    var price: Float
    
    init(orderId: Int, price:  Float) {
        self.orderId = orderId
        self.price = price
    }
    
    deinit {
        print("Order освобождени из памяти")
    }
    
    func getTotalAmpunt(discount: DInterface) -> Float {
//        let discount = Discount()
        return price * discount.calculate()
    }
}

protocol DInterface {
    func calculate() -> Float
}

class SeasonalDiscount: DInterface {
    let season: String = "Spring"
    func calculate() -> Float {
        
        switch season {
        case "Summer": return 0.8
        case "Winter": return 0.83
        case "Spring": return 0.9
        default: return 0.77
        }
    }
}

class BlackFridayDiscount: DInterface {
    func calculate() -> Float {
        return 0.5
    }
}
