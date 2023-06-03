import UIKit

class Vegetable {
    let id: Int
    var alreadyChopped:Bool = false
    
    init(id: Int) {
        self.id = id
    }
    
    func chopped(completion: @escaping ((Vegetable) -> Void)) {
        print("Vegetable \(id) start chop")
        alreadyChopped = true
        Thread.sleep(forTimeInterval: 2)
        print("Vegetable \(id) ends chop")
        
        completion(self)
    }
}

func gatherRawVegetable() -> [Vegetable] {
    [Vegetable(id: 1), Vegetable(id: 2)]
}

func chopVegetables(complection: @escaping (([Vegetable]) -> Void)) {
    let rawVaggies: [Vegetable] = gatherRawVegetable()
    var choppedVeggies = [Vegetable]()
    
    let queue = OperationQueue()
    
    for rawVaggy in rawVaggies {
        let operation = BlockOperation {
            rawVaggy.chopped { choppedVeggie in
                choppedVeggies.append(choppedVeggie)
            }
        }
        
        queue.addOperation(operation)
    }
    
    queue.addBarrierBlock {
        complection(choppedVeggies)
    }
}


chopVegetables { veggies in
    for veggie in veggies {
        print("\(veggie.id) is chopped \(veggie.alreadyChopped)")
    }
}
