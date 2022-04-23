import UIKit
import Foundation

protocol Coffee {
    var cast: Double { get }
}

class SimpleCoffee: Coffee {
    var cast: Double {
        return 3.50
    }
}

protocol CoffeeDecorator: Coffee {
    var coffee: Coffee { get }
    init(coffee: Coffee)
}

class Milk: CoffeeDecorator {
    var coffee: Coffee
    var cast: Double {
        return coffee.cast + 1
    }

    required init(coffee: Coffee) {
        self.coffee = coffee
    }
}

class Sugar: CoffeeDecorator {
    var coffee: Coffee
    var cast: Double {
        return coffee.cast + 0.50
    }

    required init(coffee: Coffee) {
        self.coffee = coffee
    }
}


let myCoffee = SimpleCoffee()
print(myCoffee.cast)
let addMilk = Milk(coffee: myCoffee)
print(addMilk.cast)
let addSugar = Sugar(coffee: addMilk)
print(addSugar.cast)
