import UIKit

class Vegetable {
    var id: Int
    var alreadyChopped = false
    
    init(id: Int) {
        self.id = id
    }
    
    func chopped() async throws -> Vegetable {
        print("Vegetable \(id) start chop")
        alreadyChopped = true
        Thread.sleep(forTimeInterval: 2)
        print("Vegetable \(id) ends chop")
        return self
    }
}

func gatherRawVeggies() -> [Vegetable] {
    [Vegetable(id: 1), Vegetable(id: 2)]
}

//функция которая очищает не очищенных овощей с помошью async await
func chopVegetable() async throws -> [Vegetable] {
    let rawVeggies = gatherRawVeggies()
    var choppedVeggies = [Vegetable]()
    
    for rawVaggie in rawVeggies {
        choppedVeggies.append(try await rawVaggie.chopped())
    }
    
    return choppedVeggies
}

//Вызов очищенных овощей
async {
    let veggies = try await chopVegetable()
    for veggie in veggies {
        print("\(veggie.id) is chopped \(String(describing: veggie.chopped))")
    }
}
