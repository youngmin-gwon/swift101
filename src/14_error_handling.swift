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
