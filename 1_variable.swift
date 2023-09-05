import Foundation

let greeting = "Hello"
var name: String = "Youngmin"

print("\(greeting), \(name)")

let myName = "Youngmin"
let yourName = "Foo"

var names = [
  myName,
  yourName,
]
// does not work if names would be changed to let
names.append("Hello")

// imagine what would happen
let foo = "Foo"
var foo2 = foo
foo2 = "Foo 2"
print("\(foo), \(foo2)")  // "Foo, Foo 2"
// why isn't foo changed? because it is value type
// simply copying value over to foo2

let foos = [
  "Hello",
  "World",
]

var foos2 = foos

foos2.append("Again")

for foo in foos2 {
  print(foo)
}
// if foos2 is typed as let,
// swift compiler says it cannot us mutating member on immutable value

// for reference, there is exception when dealing with objective c (reference)
let oldArray = NSMutableArray(array: [
  "Hello",
  "World",
])
oldArray.add("Bar")

print(oldArray)
