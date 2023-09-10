import Foundation

// use ? keyword to express optional
// - a way to describe null type
var myValue: Int? = Optional(nil)
print(myValue ?? -1)

var optDict: [String: String]? = Optional(nil)
print("\(optDict ?? [:])")

// way to declare Int variable as optional
var optInt = Int("123")
print(optInt ?? -1)

// ------
// 1. Optional release
// 1) force release: `!`
var myIntValue: Int? = 123
print(myIntValue!)

// 2) optional binding
// - automatically release optional
//   if optional variable is put into
//   constant in if, guard
class Abcde {
  func abc() {
    print("abc")
  }
}

var abcde: Abcde? = Abcde()

if let hello = abcde {
  hello.abc()
}

// guard let hello = abcde else {
//   throw exception
// }
// hello.abc()

// 3) optional release in comparison computation
var str = Int("123")
var newInt: Int = 10
if str == newInt {
  print("equal")
} else {
  print("non equal")
}

// ------
// 2. Optional Chain: `?`
// - to access optional type
