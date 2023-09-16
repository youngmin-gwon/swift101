import Foundation

// class is reference type

// we need to make constructor (unlike struct)
// using `init` keyword

// property
// 1. stored property
//  - member variable and member constant
//  - initialize with `init` keyword
class Person {
  init(
    age: Int,
    height: Int,
    name: String
  ) {
    self.name = name
    self.age = age
  }

  var name: String
  var age: Int

  func increaseAge() {
    self.age += 1
  }

}

let foo = Person(
  age: 20,
  height: 30,
  name: "Foo"
)

// 1-2. lazy stored property
class Gamer {

  lazy var loginTime: Int = login()

  func login() -> Int {
    return 3
  }
}

let gamer = Gamer()
print("Login Time: \(gamer.loginTime)")

// 2. calculation property
//  - a property which has a getter and setter, and is defined by calculation

class Hyundai {
  var year: Int = 2020  // stored
  var doubleYear: Int {
    get {
      return year
    }
    set(newValue) {
      self.year = newValue * 2
    }
  }
}

let hyundai = Hyundai()
print(hyundai.doubleYear)
hyundai.doubleYear = 2
print(hyundai.doubleYear)

// 3. property observer
//  - when some calculation is needed before or after the value changes
//  - `willSet` omits parameter and use newValue
//  - `didSet` use oldValue
//  - but, cannot use with set together
class Hacker {
  var year: Int = 2020  // 저장 프로퍼티
  var age: Int = 123 {
    willSet {
      print("willSet -- newValue=\(newValue)")
    }
    didSet {
      print("didSet -- oldValue=\(oldValue)")
    }
  }
}

let user = Hacker()
user.age = 10000
// willSet -- newValue=10000
// didSet -- oldValue=123

// 4. type property
// - type property does not create instance, rather store data in class or struct
// - put `static` in front of variable or constant, or follow this syntax
//   `class let/var property_name: type { get, set }`
class Programmer {
  static var loneliness = 10

  class var stress: Int {
    return 8
  }
}

print("loneliness: \(Programmer.loneliness), stress: \(Programmer.stress)")

// class can change member variable, but struct cannot without the keyword "mutating"
//
// value has changed even though foo is constant
// - main difference between struct and class
print(foo.age)
foo.increaseAge()
print(foo.age)

// reference type
let bar = foo
bar.increaseAge()
// two values have changed because class deliver value by reference
print(bar.age)
print(foo.age)

// instance
// - allocation of memory
// - struct instance is directly freed when out of scope
//   since it is only single referred
// - but class instance cannot dare be freed
//   since class instance can be referenced in many places
//   => class uses ARC(Auto Reference Count)

// how to compare instances of classes
if foo === bar {
  print("foo and bar point to the same memory")
} else {
  print("they don't point to the same memory")
}

// subclass
class Vehicle {
  func goVroom() {
    print("Vroom vroom")
  }
}

class Car: Vehicle {}

let car = Car()
car.goVroom()

// private setter
class User {
  private(set) var age: Int
  init(age: Int) {
    self.age = age
  }

  func increaseAge() {
    self.age += 1
  }
}

let baz = User(age: 20)
print(baz.age)
// - impossible
// baz.age += 1
baz.increaseAge()
print(baz.age)

// initializers
// (1) convenience initializer
// - to add some logic to the constructor or the initializer of the class,
//   but they essentially at the end delegate the initialization to a designated initializer
// (2) designated initializer
// - to ensure that they construct an instance of the class by ensuring that all property values are set
class Tesla {
  let manufacturer: String = "Tesla"
  let model: String
  let year: Int

  // designated initializer
  // - initializer without the keyword `convenience`
  // - designated initializer cannot delegate its work to another designated initializer
  // ```swift
  // init() {
  //   self.init(model:"X", year:2023) // wrong
  // }
  // ```
  init() {
    self.model = "X"
    self.year = 2023
  }

  init(model: String, year: Int) {
    self.model = model
    self.year = year
  }

  // convenience initializer
  convenience init(model: String) {
    self.init(model: model, year: 2023)
  }
}

// super initializer
class TeslaModelY: Tesla {
  override init() {
    // convenience initializer in super class also cannot be used
    // super.init(model: "Y")
    super.init(model: "Y", year: 2023)
  }
}

let modelY = TeslaModelY()
print(modelY.year)
print(modelY.manufacturer)
print(modelY.model)

// class is reference type
// - in some situation, struct is safe
let fooBar = User(age: 20)
print(fooBar.age)

func doSomething(with user: User) {
  user.increaseAge()
}

doSomething(with: fooBar)
print(fooBar.age)

// de-initializers
// - in some cases, it is useful, but most of the time you don't need this
// - useful for reactive programming

class MyClass {
  init() {
    print("Initialized")
  }

  func doSomething() {
    print("do something")
  }

  deinit {
    print("Deinitialized")
  }
}

let myClosure = {
  let myClass = MyClass()
  myClass.doSomething()
}

myClosure()
