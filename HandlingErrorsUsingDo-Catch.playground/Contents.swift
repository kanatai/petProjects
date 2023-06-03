import UIKit

struct Pizza {
    let dough: String
    let toppings: [String]
}

enum PizzaBuilderError: Error {
    case doughBurnt
    case noToppings(String)
}

struct PizzaBuilder {
    
    func prepare() -> Pizza? {
        do {
            let dough = try prepareDough()
            let toppings = try prepareToppings()
            
            let pizza = Pizza(dough: dough, toppings: toppings)
            return pizza
        } catch let error {
            print("Unable to prepare Pizza: \nreason is: \(error.localizedDescription)")
            return nil
        }
    }
    
    private func prepareDough() throws -> String {
        throw PizzaBuilderError.doughBurnt
    }
    
    private func prepareToppings() throws -> [String] {
        throw PizzaBuilderError.noToppings("Chicken and onions are missing")
    }
    
}

let builder = PizzaBuilder()
builder.prepare()
