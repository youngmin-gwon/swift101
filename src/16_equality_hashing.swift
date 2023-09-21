import Foundation

// equatable: makes objects check equality
struct Cat {}

struct Person: Equatable {
  let id: String
  let name: String
  // if non-equatable type is added to this, then compiler throws error
  //   let cat: Cat
}

let foo1 = Person(id: "1", name: "Foo")
let foo2 = Person(id: "1", name: "Bar")

if foo1 == foo2 {
  print("They are equal")
} else {
  print("They are NOT equal")
}

// override equality
extension Person {
  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.id == rhs.id
  }
}

enum AnimalType: Equatable {
  case dog(breed: String)
  case cat(breed: String)
}

let dog1 = AnimalType.dog(breed: "Labrador")
let dog2 = AnimalType.dog(breed: "Labrador")

// == checks all properties
if dog1 == dog2 {
  print("dogs are equal")
}

// but we can change
extension AnimalType {
  static func == (lhs: Self, rhs: Self) -> Bool {
    switch (lhs, rhs) {
    case let (.dog(lhsBreed), .dog(rhsBreed)),
      let (.cat(lhsBreed), .cat(rhsBreed)):
      return lhsBreed == rhsBreed
    default:
      return false
    }
  }
}

struct Animal: Equatable {
  let name: String
  let type: AnimalType

  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.type == rhs.type
  }
}

let cat1 = Animal(
  name: "Whiskers",
  // short hand of writing enum
  type: .cat(breed: "Street cat")
)
let cat2 = Animal(name: "Whoosh", type: .cat(breed: "Street cat"))

if cat1 == cat2 {
  print("They are equal because of their type")
} else {
  print("They are not equal")
}

// hashable
struct House: Hashable {
  let number: Int
  let numberOfBedrooms: Int
}

let house1 = House(number: 123, numberOfBedrooms: 2)
print(house1.hashValue)
let house2 = House(number: 123, numberOfBedrooms: 3)
print(house2.hashValue)

// the values are different

let houses = Set([house1, house2])
print("house counts: \(houses.count)")  // 2

struct NumberedHouse: Hashable {
  let number: Int
  let numbersOfBedrooms: Int

  func hash(into hasher: inout Hasher) {
    // as long as house numbers are equal, they have same hash
    // but it does not mean they are equal
    hasher.combine(number)
  }

  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.number == rhs.number
  }
}

let house3 = NumberedHouse(number: 123, numbersOfBedrooms: 2)
let house4 = NumberedHouse(number: 123, numbersOfBedrooms: 3)

let houses3And4 = Set([house3, house4])
print("house counts: \(houses3And4.count)")  // 1
print("house number: \(houses3And4.first!.numbersOfBedrooms)")  // 2
print("house3 hash: \(house3.hashValue)")  // 2
print("house4 hash: \(house4.hashValue)")  // 2
print("house3 number hash: \(house3.number.hashValue)")
print("house4 number hash: \(house4.number.hashValue)")

// enum is default hashable
enum CarPart {
  case roof
  case tire
  case trunk
}

let uniqueParts: Set<CarPart> = [
  .roof,
  .tire,
  .roof,
  .trunk,
]
print(uniqueParts.count)  // 3

enum HouseType: Hashable {
  case bigHouse(NumberedHouse)
  case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType.bigHouse(NumberedHouse(number: 1, numbersOfBedrooms: 1))
let bigHouse2 = HouseType.bigHouse(NumberedHouse(number: 1, numbersOfBedrooms: 1))

let smallHouse1 = HouseType.smallHouse(NumberedHouse(number: 1, numbersOfBedrooms: 1))

let allHouses: Set<HouseType> = [bigHouse1, bigHouse2, smallHouse1]
print("All house count: \(allHouses.count)")

for value in allHouses {
  print(value)
}
