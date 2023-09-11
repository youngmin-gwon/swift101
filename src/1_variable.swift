import Foundation

// without type annotation
let greeting = "Hello"
// with type annotation
var name: String = "Youngmin"
// string literal
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
// swift compiler says it cannot use mutating member on immutable value

// look at this interesting case
let oldArray = NSMutableArray(array: [
  "Hello",
  "World",
])
oldArray.add("Bar")

print(oldArray)

// range operator
for myValue: Int8 in 0...5 {
  print(myValue)
}

// closed range operator
for myValue in 0..<5 {
  print(myValue)
}
