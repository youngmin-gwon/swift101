import Foundation

// execute after assignment
let printSomething = { (val1: Int, val2: Int) -> Void in
  print("value1: \(val1), value2: \(val2)")
}

printSomething(20, 30)

// execute directly
// ({
//   (val1: Int, val2: Int) -> Void in
//   print("value1: \(val1), value2: \(val2)")
// })

// ways to execute closure
// 1. standard
let aaa = { (val1: Int, val2: Int) -> Int in
  return val1 + val2
}

print(aaa(1, 2))

// 2. omit return type
let bbb = { (val1: Int, val2: Int) in
  return val1 + val2
}

print(bbb(1, 2))

// 3. omit variable type
let ccc = { (val1, val2) -> Int in
  return val1 + val2
}

print(ccc(1, 2))

// 4. use $ keyword
let ddd: (Int, Int) -> Int = {
  return $0 + $1
}

print(ddd(1, 2))

let add2: (Int) -> Int = { (_ value: Int) -> Int in
  return value + 2
}
print(add2(23))

// Look syntax carefully
func customAdd(
  _ lhs: Int,
  _ rhs: (Int) -> Int
) -> Int {
  return rhs(lhs)
}

// Look syntax carefully
// use trailing closure as much as possible
print(
  customAdd(
    23
  ) { (lhs: Int) -> Int in
    return lhs + 2
  })

let add3: (Int) -> Int = { (value: Int) in
  return value + 3
}

func customAdd3(_ lhs: Int, _ function: (Int) -> Int) -> Int {
  return function(lhs)
}

print(
  customAdd3(3) { (lhs: Int) -> Int in
    return lhs + 3
  }
)

// The code above could be summarized to this
// but, compiler should work more to figure out the data type
print(
  customAdd3(3) { (lhs) in
    return lhs + 3
  }
)

// Another way
print(
  customAdd3(3) {
    return $0 + 3
  }
)

// -------
let ages = [30, 20, 19, 40]
print(
  ages.sorted(by: { (lhs: Int, rhs: Int) -> Bool in
    return lhs > rhs
  }))

print(ages.sorted(by: >))
print(ages.sorted(by: <))

// annotation
