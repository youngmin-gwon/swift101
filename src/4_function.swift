import Foundation

func plusTwo(_ value: Int) -> Int {
  return value + 2
}

print(plusTwo(2))

func newPlusTwo(value: Int) -> Int {
  value + 2
}

// first way to call
print(newPlusTwo(value: 56))
// second way to call
print(newPlusTwo(value:)(56))

func customAdd(
  value1: Int,
  value2: Int
) -> Int {
  return value1 + value2
}

print(customAdd(value1: 5, value2: 6))

// external / internal name

// underscore simply means external name should not
// have argument name
func customMinus(
  _ lhs: Int,
  _ rhs: Int
) -> Int {
  lhs - rhs
}

let customSubtracted = customMinus(20, 10)
print(customSubtracted)

// if you want to write a function that does produce a value,
// but call site doesn't necessarily have to consume that value
// you can mark that function as discardableResult

@discardableResult
func myCustomAdd(_ lhs: Int, _ rhs: Int) -> Int {
  return lhs + rhs
}

myCustomAdd(1, 3)

// inner function
func doSomethingComplicated(with value: Int) -> Int {
  func mainLogic(value: Int) -> Int {
    return value + 2
  }

  return mainLogic(value: value + 3)
}

print(doSomethingComplicated(with: 30))

// input function
func doSomethingMoreWith(param: Int, myFunc: (Int) -> Int) -> Int {
  return myFunc(param)
}

print(doSomethingMoreWith(param: 40, myFunc: doSomethingComplicated))

// default value
func getFullName(
  firstName: String = "Foo",
  lastName: String = "Bar"
) -> String {
  return "\(firstName) \(lastName)"
}

print(getFullName())
print(getFullName(firstName: "Hello"))
print(getFullName(lastName: "Hello"))
print(getFullName(firstName: "Hello", lastName: "World!"))

// defer block
// - execute command in defer reversely after executing all commands in function
func testNewDefer() {
  defer { print("defer #3") }
  defer { print("defer #2") }
  defer { print("defer #1") }
  print("do something")
}
testNewDefer()

// - works from the outermost
func testDefer() {

  defer {
    defer {
      defer {
        print("defer #3")
      }
      print("defer #2")
    }
    print("defer #1")
  }
  print("do something")
}

testDefer()

// when to use?
// - when releasing Lock with NSLock
// - when closing db with sqlite3
// -------

// typealias
typealias OnClick = () -> Void

// args
func printMultipleArgs(_ variables: Int...) {
  for variable in variables {
    print(variable)
  }
}

printMultipleArgs(1, 2, 3, 4, 5)

// how to modify variable
// 1) declare new variable
func myFunc(_ variable: Int) -> Int {
  var newVariable = variable
  newVariable += 1
  return newVariable
}

// 2) inout (call by reference)
func inOutReference(_ variable: inout Int) {
  variable += 1
}
var cnt = 1
print(cnt)
inOutReference(&cnt)
print(cnt)
