import Foundation

let numbers = [1, 2, 3, 4]
print(numbers.first ?? "empty")
print(numbers.last ?? "empty")

let newNumbers = numbers.map(-)
print(newNumbers)

// collection can be mutated when it is declared as `var`
var mutatingNumber = [4, 5, 6]
mutatingNumber.append(7)
mutatingNumber.insert(3, at: 0)
mutatingNumber.insert(contentsOf: [1, 2], at: 0)
print(mutatingNumber)

// for tips: where
// pattern matching
for number in mutatingNumber where number % 2 == 0 {
  print(number)
}

// map syntax
let mapNumbers = mutatingNumber.map { (value: Int) -> Int in
  return value * 2
}

print(mapNumbers)

// filter syntax
print(
  mutatingNumber.filter { (value: Int) -> Bool in
    value > 3
  }
)

// compact mapping: similar to map, but it returns optional
// - combination of map and filter
let compacts = mutatingNumber.compactMap { (value: Int) -> String? in
  return value % 2 == 0 ? String(value) : nil
}
print(compacts)

let numbers2: [Int?] = [1, 2, nil, 4, 5]
print(numbers2.count)

let notNils = numbers.compactMap { (value: Int?) -> Int? in
  return value
}
print(notNils)

// use any keyword declaration for heterogenous objects
let stuffs: [Any] = [1, "hello", 2, "world"]
print(stuffs)
print(stuffs.count)

// `as?` keyword: to extract certain type variable
let intsInStuffs = stuffs.compactMap { (value: Any) -> Int? in
  return value as? Int
}

let stringsInStuffs = stuffs.compactMap { (value: Any) -> String? in
  return value as? String
}

print(intsInStuffs)
print(stringsInStuffs)

// how Set calculate uniqueness: `Hashable` protocol
struct Person: Hashable {
  let id: UUID
  let name: String
  let age: Int
}

let fooId = UUID()
let foo = Person(id: fooId, name: "Foo", age: 20)
let bar = Person(id: fooId, name: "Bar", age: 30)

let people = Set<Person>([foo, bar])
print(people.count)  // 2, weird since uuid is same. it is because of the hash calculation

// Do the work in this way
struct Person2: Hashable {
  let id: UUID
  let name: String
  let age: Int

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.id == rhs.id
  }
}

let bazId = UUID()
let baz = Person2(id: bazId, name: "Baz", age: 20)
let qux = Person2(id: bazId, name: "Qux", age: 30)
if baz == qux {
  print("they are same")
}

let people2 = Set([baz, qux])
print(people2.count)  // 1

// Dictionary
let userInfo: [String: Any] =
  [
    "name": "Foo",
    "age": 20,
    "address": [
      "line1": "Address line 1",
      "post_code": "12345",
    ],
  ] as [String: Any]

// how to wrap
for (key, value) in userInfo where value is Int {
  print(key)
  print(value)
}

for (key, value) in userInfo where value is Int && key.count > 2 {
  print(key)
  print(value)
}
