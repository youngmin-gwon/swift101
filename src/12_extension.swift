import Foundation

// Add functionality to existing type

extension Int {
  func plusTwo() -> Int {
    return self + 2
  }
}

let two = 2
print(two.plusTwo())

// using extension, user can add initializer to existing type

struct Person {
  let firstName: String
  let lastName: String
}

extension Person {
  init(fullName: String) {
    let components = fullName.components(separatedBy: " ")
    self.init(firstName: components[0], lastName: components[1])
  }
}

let person = Person(fullName: "John Doe")
print(person)

protocol GoesVroom {
  var vroomValue: String { get }
  func goVroom() -> String
}

extension GoesVroom {
  func goVroom() -> String {
    return "\(self.vroomValue) goes vroom!"
  }
}

struct Car {
  let manufacturer: String
  let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "X")

extension Car: GoesVroom {
  var vroomValue: String {
    return "\(self.manufacturer) model \(self.model)"
  }
}

print(modelX.goVroom())

// having extension on class with convenience of extension
class MyDouble {
  var value: Double
  init(value: Double) {
    self.value = value
  }
}

extension MyDouble {
  convenience init() {
    self.init(value: 0)
  }
}

let myDouble = MyDouble()
print(myDouble.value)

// extension can extend protocol

extension GoesVroom {
  func goVroomEvenMore() -> String {
    "\(self.vroomValue) is vrooming even more!"
  }
}

print(modelX.goVroomEvenMore())
