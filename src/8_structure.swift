import Foundation

// Structure
// - swift's way to group data together and give some sort of a name

// Difference between structure and class
// 1. Class
//  - inheritance
//  - type casting
//  - dispose syntax
//  - deliver by reference
// 2. Structure
//  - member-wise initializer(constructor is always created by compiler)
//
// Structure is just copy of values, but Class delivers reference
// Class can change member variables with methods,
//  but Structure cannot except the way using the keyword `mutating`

struct User {
  var firstName: String = "John"
  var lastName: String = "Doe"

  func getFullName() -> String {
    return "\(firstName) \(lastName)"
  }
}

// basic initialization
let defaultUser = User()
let customUser = User(firstName: "Kevin", lastName: "Hart")
print(defaultUser.firstName)
print(customUser.firstName)

// how to make custom constructor for structure
struct CommodoreComputer {
  let name: String
  let manufacturer: String = "Commodore"
  //   init(name: String) {
  //     self.name = name
  //   }
}

let c64 = CommodoreComputer(name: "Commodore 64")
print(c64)

// computed property
struct Person {
  let firstName: String
  let lastName: String
  // this does not work
  // let fullName: String = "\(firstName) \(lastName)"

  // use this instead
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
}

var person1 = Person(firstName: "John", lastName: "Doe")
print(person1.fullName)

// how to change mutable structure
struct Car {
  var currentSpeed: Int
  // add prefix mutating
  mutating func drive(speed: Int) {
    print("Driving...")
    // this does not work
    currentSpeed = speed
  }
}

var mutableCar = Car(currentSpeed: 2)
print(mutableCar)
mutableCar.drive(speed: 5)
print(mutableCar)

let immutableCar = Car(currentSpeed: 5)
// this does not work
// immutableCar.drive(speed: 10)
// print(immutableCar)

// how to copy value
let copy = mutableCar
mutableCar.drive(speed: 30)
// verifying  car
print(mutableCar.currentSpeed)
print(copy.currentSpeed)

// how to custom copy: create function for copy
struct Bike {
  let manufacturer: String
  let currentSpeed: Int

  func copyWith(
    manufacturer: String?,
    currentSpeed: Int?
  ) -> Bike {
    return Bike(
      manufacturer: manufacturer ?? self.manufacturer,
      currentSpeed: currentSpeed ?? self.currentSpeed
    )
  }
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)
let bike2 = bike1.copyWith(manufacturer: nil, currentSpeed: 30)
let bike3 = bike1.copyWith(manufacturer: "Kawasaki", currentSpeed: nil)
print(bike1)
print(bike2)
print(bike3)

// Structure cannot subclass
