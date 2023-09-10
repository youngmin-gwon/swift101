import Foundation

// 1. array
// array in swift is dynamic array,
// which means if one of elements in the middle has been removed,
// elements behind the element removed is moved one element forward respectively

// 1) declaration
// var myArr: [Int] = Array()
// var myArr = [Double]()
var myArr: [Double] = []
print(myArr)

// 2) exploration
var names = ["kim", "lee", "seo"]
// (1) index
for index: Int in 0..<names.count {
  print(names[index])
}
// (2) iterator
for name: String in names {
  print(name)
}
// (3) index 값 찾기
for name in names {
  for char in name {
    print(name.firstIndex(of: char) ?? -1)
  }
}

// 3) addition
// append
names.append("cha")
print(names)
// insert
names.insert("gwon", at: 0)
print(names)
// append(sequence)
names.append(contentsOf: ["a", "b", "c"])
print(names)
// repeating
var newNames = Array(repeating: 0, count: 3)
print(newNames)
// range operator
var newArray = ["a", "e", "f"]
// it seems append does not match exact range
newArray[1...2] = ["b", "c"]
newArray[1...2] = ["b", "c", "d", "e"]
print(newArray)

// ----
// 2. Set
// 1) declaration
var unique = Set<String>()
var unique2: Set<String> = []
print(unique)
print(type(of: unique))
print(unique2)
print(type(of: unique2))

// 2) insertion
unique.insert("b")
unique.insert("b")
print(unique)
unique.insert("a")
print(unique)
print(unique.sorted())

// 3) deletion
if let removeItem = unique.remove("a") {
  print("\(removeItem) remove")
} else {
  print("none")
}

// unique.removeAll()
print(unique)

// 4) exploration
if unique.contains("b") {
  print("unique contains b")
}

// 5) Use Case: remove duplicated items in array
var duplicatedArray = [1, 2, 2, 2, 3, 4, 5, 5, 5]
var uniqueArray = Array(Set(duplicatedArray)).sorted()
print(uniqueArray)
print(type(of: uniqueArray))
// ----------
// 3. Tuple
let myTuple: (String, Bool) = ("abcde", true)
print(myTuple)
print("1st element of tuple: \(myTuple.0)")
print("2nd element of tuple: \(myTuple.1)")
print(type(of: myTuple))

let (first, second) = myTuple
print(first, second)

// ----------
// 4. Dictionary
// 1) declaration
var myDictionary = [String: Int]()
print(myDictionary)
print(type(of: myDictionary))

// 2) addition
myDictionary["Hello"] = 0
myDictionary["World"] = 1
print(myDictionary)

// 3) read
print(myDictionary["Hello"] ?? -1)

for (key, value) in myDictionary {
  print("key: \(key), value: \(value)")
}

// 4) deletion
myDictionary.removeValue(forKey: "Hello")
myDictionary["World"] = nil
print(myDictionary)
