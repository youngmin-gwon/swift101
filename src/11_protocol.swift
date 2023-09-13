import Foundation

// protocol is kind of interface
protocol CanBreath {
  func breathe()
}

struct Animal: CanBreath {
  func breathe() {
    print("Animal breathing...")
  }
}

struct Person: CanBreath {
  func breathe() {
    print("Person breathing...")
  }
}

let dog = Animal()
dog.breathe()
let person = Person()
person.breathe()

// cannot implement body in protocol => use `extension`
protocol CanJump {
  func jump()
}

extension CanJump {
  func jump() {
    print("Jumping...")
  }
}

struct Cat: CanJump {
}

let cat = Cat()
cat.jump()

// protocol can also have states
protocol HasName {
  var name: String { get }
  var age: Int { get set }
}

extension HasName {
  func describeMe() -> String {
    return
      "Your name is \(name) and you are \(age) years old."
  }

  mutating func increaseAge() {
    age += 1
  }
}

struct Dog: HasName {
  let name: String
  var age: Int
}

var woof = Dog(name: "Woof", age: 10)
woof.age += 1

print(woof.age)
print(woof.name)
print(woof.describeMe())
woof.increaseAge()
print(woof.age)

// protocol have mutating function
protocol Vehicle {
  var speed: Int { get set }
  mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
  mutating func increaseSpeed(
    by value: Int
  ) {
    self.speed += value
  }
}

struct Bike: Vehicle {
  var speed: Int = 0
  // or
  //
  // init() {
  //   self.speed = 0
  // }
}

var bike = Bike()
print(bike.speed)
bike.increaseSpeed(by: 20)
print(bike.speed)

// `is` keyword
// - check whether an object conforms to a protocol or not

func describe(obj: Any) {
  if obj is Vehicle {
    print("obj conforms to the vehicle protocol")
  } else {
    print("obj does not conform to the vehicle protocol")
  }
}

describe(obj: bike)

// `as?` keyword
// - conditionally promote object to specific type
func increaseSpeedIfVehicle(obj: Any) {
  if var vehicle = obj as? Vehicle {
    print(vehicle.speed)
    vehicle.increaseSpeed(by: 20)
    print(vehicle.speed)
  } else {
    print("This was not a vehicle")
  }
}

increaseSpeedIfVehicle(obj: bike)
// struct is value type
print(bike.speed)
