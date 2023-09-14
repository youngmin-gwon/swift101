import Foundation

func perform<T>(
  _ operation: (T, T) -> T,
  on lhs: T,
  and rhs: T
) -> T {
  return operation(lhs, rhs)
}

let value = perform(+, on: 10, and: 20)
print(perform(+, on: 10, and: 20))
print(perform(-, on: 10, and: 20))
print(perform(*, on: 10, and: 20))
print(perform(/, on: 20, and: 10))

// another way to create generic
func perform2<T>(
  _ operation: (T, T) -> T,
  on lhs: T,
  and rhs: T
) -> T where T: Numeric {
  return operation(lhs, rhs)
}

let value2 = perform2(+, on: 10, and: 20)
print(perform2(+, on: 10, and: 20))
print(perform2(-, on: 10, and: 20))
print(perform2(*, on: 10, and: 20))
print(perform2(/, on: 20, and: 10))

protocol CanJump {
  func jump()
}

protocol CanRun {
  func run()
}

struct Person: CanJump, CanRun {
  func jump() {
    print("Jumping...")

  }

  func run() {
    print("Running...")
  }

}

func jumpAndRun<T: CanJump & CanRun>(_ value: T) {
  value.jump()
  value.run()
}

let person: Person = Person()
jumpAndRun(person)

let names: [String] = ["Foo", "Bar"]

extension [String] {
  func longestString() -> String? {
    self.sorted { (lhs: String, rhs: String) -> Bool in
      lhs.count > rhs.count
    }.first
  }
}

print(["Foo", "Bar Baz", "Qux"].longestString()!)

// generic protocol

protocol View {
  func addSubView(_ view: View)
}

extension View {
  func addSubView(_ view: View) {

  }
}

struct Button: View {

}
