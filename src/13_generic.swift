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
    // empty
  }
}

struct Button: View {

}

struct Table: View {

}

// generic protocol
protocol PresentableAsView {
  associatedtype ViewType: View
  func produceView() -> ViewType
  func configure(
    superView: View,
    thisView: ViewType
  )
  func present(
    view: ViewType,
    on superView: View
  )
}

extension PresentableAsView {
  func configure(
    superView: View,
    thisView: ViewType
  ) {
    // empty by default
  }

  func present(view: ViewType, on superView: View) {
    return superView.addSubView(view)
  }
}

struct MyButton: PresentableAsView {
  func produceView() -> Button {
    Button()
  }

  func configure(
    superView: View,
    thisView: Button
  ) {
    // compiler automatically understand the viewType
  }

  func present(
    view: Button,
    on superView: View
  ) {
    // compiler automatically understand the viewType
  }
}

// how to constraint generic protocol : `where`

extension PresentableAsView where ViewType == Button {
  func doSomethingWithButton() {
    print("This is a button")
  }
}

let button = MyButton()
button.doSomethingWithButton()

// this cannot use 'doSomethingWithButton' because of constraints
struct MyTable: PresentableAsView {
  func produceView() -> Table {
    Table()
  }
}

let myTable = MyTable()
// myTable.doSomethingWithButton()

extension [Int] {
  func average() -> Double {
    return Double(self.reduce(0, +)) / Double(self.count)
  }
}

let numbers = [1, 2, 3, 4, 5]
print(numbers.average())
