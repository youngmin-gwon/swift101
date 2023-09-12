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
  mutating func increaseAge(by value: Int)
}
