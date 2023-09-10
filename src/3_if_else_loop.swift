// 1. Conditions
var apple = 2
var banana = 1

// guard 조기 종료를 위한 제어문
// guard banana != 0 else {
//   return
// }

print(apple / banana)

if #available(iOS 9, *) {
  print("available in iOS9")
} else {
  print("not available in iOS9")
}

let myValue = 1
switch myValue {

case 1, 2:
  print("abc")
case 3, 4:
  print("3,4")
case 123:
  fallthrough
default:
  print("not")
}

myOuterLoop: for outer in 1...100 {
  myInnerLoop: for inner in 1...9 {
    if inner == 5 {
      break myOuterLoop
    }
  }
}
// ---------
// 2. Loop

// for
// c-style for loop has been removed from swift3
for variable: Int8 in 0...5 {
  print(variable)
}

for variable: Int8 in 0..<5 {
  print(variable)
}

// while
var variable = 0
while variable < 10 {
  print(variable)
  variable += 1
}

// repeat (do while)
var ticker = 0
repeat {
  print(ticker)
  ticker += 1
} while ticker < 10
