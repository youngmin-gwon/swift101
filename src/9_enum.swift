import Foundation

// one of the most enumeration form in programming language
enum Animals {
  case dog
  case cat
  case rabbit
  // or you can define like this
  case eagle, pig, squirrel
  case hedgeHog
}

let cat = Animals.cat
print(cat)

func describeAnimal(_ animal: Animals) {
  switch animal {
  case .cat:
    print("Oh this is cat")
  case Animals.dog:
    print("Oh this is dog")
  // usually not good idea
  //   default:
  //     doSomething()
  case .rabbit:
    print("Oh this is rabbit")
  case .pig:
    print("Oh this is pig")
  case .eagle:
    print("Oh this is eagle")
  case .squirrel:
    print("Oh this is squirrel")
  case .hedgeHog:
    print("Oh this is hedgehog")
  }
}

describeAnimal(cat)

// enumeration with associated values
enum Shortcut {
  case fileOrFolder(path: URL, name: String)
  case wwwUrl(address: URL)
  case song(artist: String, songName: String)

}

let wwwApple = Shortcut.wwwUrl(
  address: URL(string: "https://apple.com")!
)

print(wwwApple)

// how to compare enum: define equality operator
// - let's cover it later

// how to unpack enum
switch wwwApple {
case let .fileOrFolder(path, name):
  print("")
  print(path)
  print(name)
case let .song(artist, songName):
  print("")
  print(artist)
  print(songName)
case let .wwwUrl(address):
  print(address.absoluteString)
}

if case let .wwwUrl(address) = wwwApple {
  print(address.absoluteString)
}

let withoutYou = Shortcut.song(
  artist: "Symphony X",
  songName: "Without You"
)

if case let .song(_, songName) = withoutYou {
  print(songName)
}

// case with similar data type: enum func

enum Vehicle {
  case car(manufacturer: String, model: String)
  case bike(manufacturer: String, yearMade: Int)

  var manufacturer: String {
    switch self {
    case let .bike(manufacturer, _),
      let .car(manufacturer, _):
      return manufacturer
    }
  }
}

let car = Vehicle.car(manufacturer: "Tesla", model: "X")
print(car.manufacturer)

let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1987)
print(bike.manufacturer)

// enumeration with raw value
enum FamilyMember: String {
  case father = "Dad"
  case mother = "Mom"
  case brother = "Bro"
  case sister = "Sis"
}

print(FamilyMember.father.rawValue)
print(FamilyMember.mother.rawValue)

// automatically increment raw value 1
enum Transportation: Int {
  case bus = 1
  case subway = 3
  case bike = 9
  case walk
}

print(Transportation.walk.rawValue)

enum FavoriteEmoji: String, CaseIterable {
  case blush = "😳"
  case rocket = "🚀"
  case fire = "🔥"
}

print(FavoriteEmoji.allCases)
for value in FavoriteEmoji.allCases {
  print(value.rawValue)
}

if let blush = FavoriteEmoji(rawValue: "😳") {
  print("found the blush emoji")
} else {
  print("this emoji doesn`t exist")
}

if let snow = FavoriteEmoji(rawValue: "❄️") {
  print("snow exists? really?")
} else {
  print("as expected, snow doesn't exist in our enum")
}

// mutating members in enumeration
enum Height {
  case short, medium, long
  mutating func makeLong() {
    self = Height.long
  }
}

var myHeight = Height.medium
print(myHeight)
myHeight.makeLong()
print(myHeight)

// class-like enum
enum MyEnum: Int {
  case abc = 123
  var value: Int {
    return 1
  }

  func printValue(newValue: Int) {
    print("input value: \(newValue)")
  }

  // type method cannot be instantiated
  static func getName() -> String {
    return "abc"
  }
}

var newEnum: MyEnum = .abc
newEnum.printValue(newValue: 10)
// type method cannot be instantiated
print(MyEnum.getName())

// recursive enumeration or indirect enumeration
indirect enum IntOperation {
  case add(Int, Int)
  case subtract(Int, Int)
  // this originally makes error if there is not keyword indirect
  case freehand(IntOperation)

  func calculateResult(of operation: IntOperation? = nil) -> Int {
    switch operation ?? self {

    case let .add(lhs, rhs):
      return lhs + rhs
    case let .subtract(lhs, rhs):
      return lhs - rhs
    case let .freehand(operation):
      return calculateResult(of: operation)
    }
  }
}

let freeHand = IntOperation.freehand(.add(2, 4))
print(freeHand.calculateResult())
