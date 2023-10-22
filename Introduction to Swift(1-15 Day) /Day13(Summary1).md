# 👨🏻‍💻 Day 13 

## 📖 Summary - 1 

- Variables and Constants
- Types of Data
- Operators
- String Interpolation
- Arrays
- Dictionaries
- Conditional Statements
- Loops
- Switch Case


## Variables and Constants

```swift
var name = "Ahmet Tunahan"  
// Variables 
// - Changeable
// - Fast  
// - Unique Name

let age = 22
// Constants
// - Not Changeable
// - More Fast
// - Unique Name
```

## Types of Data

```swift
var name : String
name = "Tunahan"

var age : Int
number = 22

var dAge : Double
dNumber = 22.0

var fAge : Float
fNumber = 22.0

var is : Bool
is = true
```

### ⚙️ Double vs Float
Actually, these are very similar Swift types. But... Apple **recommends** that we use <code>Double</code>. <br>
Because it has more accurate results in larger numbers.

### Usage Tips
Swift can automatically assign value types and protect them.<br>
However, it is recommended that you determine the types yourself.

```swift
var fAge = 22.0 // Float
```
```swift
var dAge : Double = 22.0 // Double
```


## Operators
### Basic
```swift
var number : Int = 22
number = number + 1 // 23
number = number - 1 // 21
number = number * 2 // 44
number = number / 2 // 11
```

```swift
var number : Int = 22
number += 1 // 23
number -= 1 // 21
number *= 2 // 44
number /= 2 // 11
```

```swift
var number : Double = 22.0
var number2 : Double = 22.0

var result = number + number2 // 44.0
```

```swift
var name = "Tunahan"
var surname = "Bekdaş"

var fullName = name + " " + surname // Tunahan Bekdaş
```

### Comparison
```swift
var num : Int = 22
var num2 : Int = 23

var result : Bool

result = num > num2 // false
result = num < num2 // true
result = num >= num2 // false
result = num <= num2 // true
```
```swift
var name : String = "Tunahan"
var result : Bool 
result = (name == "Tunahan") // true
```
```swift
var result = false
result // false
!result // true
```
```swift
var num : Int = 12
var result : Bool
result = (num == 12) // Equal -> true
result = (num != 12) // Not Equal -> false
```

## String Interpolation
```swift
let age = "Tunahan"
let text = "My name is \(name)"
```
```swift
let fNumber : Float = 12.0
let text = "This number : \(fNumber) is float"
```
```swift
let age : Int = 22
let text = "I'm \(age) years old."
```

## Arrays
```swift
let numbers = [1, 2, 3, 4, 5]
let lettes = ["a", "b", "c", "d", "e"]

var first = numbers[3] // 4
```
```swift
let numbers : [Int] = [1, 2, 3, 4, 5]
let lettes : [String] = ["a", "b", "c", "d", "e"]
let shuffle : [Any] = [1 , "a" , true]
```
```swift
var array : [String] = []
var array2 = [String]()
var array3 = Array<String>()
```

## Dictionaries
```swift
var me = [
    "name" : "Tunahan",
    "surname" : "Bekdaş",
    "job" : "Developer"
]
me["name"] // Tunahan
```
```swift
var me : [String : Any] = [
    "name" : "Tunahan" ,
    "surname" : "Bekedaş" ,
    "age" : 22 ,
    "hobbies" : ["chess","fitness"]
]

me["hobbies"] // ["chess","fitness"]
```

## Conditional Statements
```swift
var youGood = true

if youGood {
  print("Learn more Learn")
}
```
```swift
var isMan = true
var isStudent = true

if isMan && isStudent {
  print("Check")
}else{
  print("None")
}
```

## Loops
```swift
for x in 1...10{
    print("\(x) * 8 : \(i * 10)")
}
```
```swift
for _ in 1...10{
    print("Machina!")
}
```
```swift
var myArray = ["A", "B", "C", "D", "E", "F"]
for i in myArray {
    print(i)
}
```
```swift
let songs = ["wish i loved you in the 90s", "bad ones" , "you broke me first"]
for song in songs{
    if song != "wish i loved you in the 90s"{
      continue
    }
    print("My favorite song is \(song)")
}
```

### Inner loops
```swift
for i in 0..<10{
    for j in (0..<10).reversed(){
        print("\(i) or \(j)")
    }
}
```

```swift
var people = ["A", "B", "C", "D", "E"]
var actions = ["good", "bad", "angry", "happy"]

for i in 0..<people.count {
    for z in 0..<actions.count {
        print("\(people[i]) is \(actions[z])")
    }
}
```


var result = 0
var total = 0

```swift
for i in 1...20 {
    for z in 20...30{
        print("\(i) x \(z) = \(i * z)")
        result = i * z
        
       total += result
        
        print(total)
    }
}
```

```swift
var song = ["A", "B", "C", "D", "E"]


for songs in song {
    if sons == "C"{
        continue
    }
    print("I love \(songs)")
}
```

### While
```swift
var counter = 0
while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 666 {
        break
    }
}
```

## Switch Case
```swift
let playerHealth = 3

switch playerHealth {
case 1:
    print("You're on the brink of death")

case 2:
    print("Your health is at a medium level")

case 3:
    print("You are healthy")

default:
    print("You have died")
}
```

```swift
let userAge = 20

switch userAge {
case 0...18:
    print("You are kid")

case 19...40:
     print("You are adult")

case 41...90:
    print("You are old")

default:
    print("Probably you died")
}
```
