import Foundation

let myAge: UInt8 = 22
let yourAge: UInt8 = 20

if myAge > yourAge {
  print("I am older than you")
} else if myAge < yourAge {
  print("I am younger than you")
} else {
  print("We are the same age")
}

// basic operator
let myMothersAge: UInt8 = myAge + 30
let doubleMyAge: UInt8 = myAge * 2

/// unary prefix
let foo = !true

/// unary postfix
let name = Optional("Youngmin")
print(type(of: name))
let unaryPostFix = name
print(type(of: unaryPostFix))

/// binary infix
let result = 1 + 2
let names = "Foo" + " " + "Bar"

/// ternary operator
/// - controversial topic, so make conversation with your teammate
let age = 30
let message = age >= 18 ? "You are an adult" : "You are not adult"
