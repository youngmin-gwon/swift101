import Foundation

struct Person {
  var firstName: String?
  var lastName: String?

  enum Errors: Error {
    case firstNameIsNil
    case lastNameIsNil
    case bothNamesAreNil
  }

  func getFullName() throws -> String {
    switch (firstName, lastName) {
    case (.none, .none):
      throw Errors.bothNamesAreNil
    case (.none, .some):
      throw Errors.firstNameIsNil
    case (.some, .none):
      throw Errors.lastNameIsNil
    case let (.some(firstName), .some(lastName)):
      return "\(firstName) \(lastName)"
    }
  }
}

let foo = Person(firstName: "Foo", lastName: nil)

// try catch
do {
  let fullName = try foo.getFullName()
  print(fullName)
} catch {
  print("Got an error = \(error)")
}

// how to catch specific type
do {
  let fullName = try foo.getFullName()
  print(fullName)
} catch is Person.Errors {
  print("Got an error")
}

// how to catch specific error
let bar = Person(firstName: nil, lastName: nil)
do {
  let fullName = try bar.getFullName()
  print(fullName)
} catch Person.Errors.firstNameIsNil {
  print("First name is nil")
} catch Person.Errors.lastNameIsNil {
  print("Last name is nil")
} catch Person.Errors.bothNamesAreNil {
  print("Both names are nil")
} catch {
  print("Some other error was thrown")
}

// throws errors in constructor of struct or class
struct Car {
  let manufacturer: String

  enum Errors: Error {
    case invalidManufacturer
  }

  init(manufacturer: String) throws {
    if manufacturer.isEmpty {
      throw Errors.invalidManufacturer
    }
    self.manufacturer = manufacturer
  }
}

do {
  let myCar = try Car(manufacturer: "")
  print(myCar.manufacturer)
} catch Car.Errors.invalidManufacturer {
  print("Invalid manufacturer")
} catch {
  print("Some other error")
}

// without do/catch statement
if let yourCar = try? Car(manufacturer: "Tesla") {
  print("Success, your car = \(yourCar)")
} else {
  print("Failed to construct and error is not accessible now")
}

struct Dog {
  let isInjured: Bool
  let isSleeping: Bool

  enum BarkingErrors: Error {
    case cannotBarkIsSleeping
  }

  enum RunningErrors: Error {
    case cannotRunIsInjured
  }

  func bark() throws {
    if isSleeping {
      throw BarkingErrors.cannotBarkIsSleeping
    }
    print("Barking...")
  }

  func run() throws {
    if isInjured {
      throw RunningErrors.cannotRunIsInjured
    }
    print("Running...")
  }

  func barkAndRun() throws {
    try bark()
    try run()
  }
}

let dog = Dog(isInjured: true, isSleeping: true)

do {
  try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSleeping, Dog.RunningErrors.cannotRunIsInjured {
  print("Cannot-bark-is-sleeping OR cannot-run-is-injured")
} catch {
  print("Some other error")
}

do {
  try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSleeping {
  print("Cannot-bark-is-sleeping")
} catch Dog.RunningErrors.cannotRunIsInjured {
  print("cannot-run-is-injured")
} catch {
  print("Some other error")
}

// rethrows
func fullName(
  firstName: String?,
  lastName: String?,
  calculator: (String?, String?) throws -> String?
) rethrows -> String? {
  return try calculator(firstName, lastName)
}

enum NameErrors: Error {
  case firstNameInvalid
  case lastNameInvalid
}

func + (firstName: String?, lastName: String?) throws -> String? {
  guard let firstName, !firstName.isEmpty else {
    throw NameErrors.firstNameInvalid
  }

  guard let lastName, !lastName.isEmpty else {
    throw NameErrors.lastNameInvalid
  }

  return "\(firstName) \(lastName)"
}

do {
  let fooBar = try fullName(firstName: nil, lastName: nil, calculator: +)
  print(fooBar ?? "")
} catch NameErrors.firstNameInvalid {
  print("First name is invalid")
} catch NameErrors.lastNameInvalid {
  print("Last name is invalid")
} catch let err {
  print("Some other error = \(err)")
}

// `results`
// - either in other languages
// - useful when writing API

enum IntegerErrors: Error {
  case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(from int: Int) -> Result<Int, IntegerErrors> {
  guard int > 0 else {
    return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
  }
  return Result.success(int - 1)
}

func performGet(forValue value: Int) {
  switch getPreviousPositiveInteger(from: value) {
  case let .success(previousValue):
    print("Previous Value is \(previousValue)")
  case let .failure(error):
    switch error {
    case let .noPositiveIntegerBefore(thisValue):
      print("No positive integer before \(thisValue)")
    }
  }
}

performGet(forValue: 0)
performGet(forValue: 2)
