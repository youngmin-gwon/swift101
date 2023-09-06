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

myOuterLoop: for outer in 1 .. 100 {
  myInnerLoop: for inner in 1 .. 9 {
    if inner == 5 {
      break myOuterLoop
    }
  }
}
