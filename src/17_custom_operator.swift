import Foundation

let firstName: String? = "Foo"
let lastName: String? = " Bar"

// no operator for optional string
if let fullName = firstName + lastName {
  print(fullName)
}

// binary prefix operator
extension String? {
  static func + (lhs: Self, rhs: Self) -> Self {
    switch (lhs, rhs) {
    case (.none, .none):
      return nil
    case let (.some(value), .none), let (.none, .some(value)):
      return value
    case let (.some(lhs), .some(rhs)):
      return lhs + rhs
    }
  }
}

// unary prefix operator
let lowerCaseName = "foo bar"
let upperCaseName = ^lowerCaseName
print(upperCaseName)

prefix operator ^
prefix func ^ (value: String) -> String {
  return value.uppercased()
}

// how to make `*** name ***``

// unary postfix operator
let withStars = lowerCaseName*
print(withStars)

postfix operator *
postfix func * (value: String) -> String {
  return "*** \(value) ***"
}

// what if not primitive type

struct Person {
  let name: String
}

struct Family {
  let members: [Person]
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1 = Person(name: "Daughter1")
let daughter2 = Person(name: "Daughter2")

// what about this situation
let family = mom + dad
print(family)

func + (lhs: Person, rhs: Person) -> Family {
  return Family(members: [lhs, rhs])
}

// what about this situation
let familyWithSon = family + son
print(familyWithSon)

func + (lhs: Family, rhs: Person) -> Family {
  var members = lhs.members
  members.append(rhs)
  return Family(members: members)
}

// what about this situation
let familyWithDaughters = familyWithSon + [daughter1, daughter2]
print(familyWithDaughters)

func + (lhs: Family, rhs: [Person]) -> Family {
  var members = lhs.members
  members.append(contentsOf: rhs)
  return Family(members: members)
}
