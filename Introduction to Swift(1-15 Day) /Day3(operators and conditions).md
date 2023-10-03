# 👨🏻‍💻 Day 3

## 📖 Operators and Conditions 
Operators and conditions are used to perform mathematical operations.

## ⚒️ Usage 

### Arithmetic Operators

```swift
let number1 = 7
let number2 = 3

let total = number1 + number2
let difference = number1 - number2
let multiply = number1 * number2
let division = number1 / number2
let remainder = number1 % number2

print(total) // 9
print(difference) // 4
print(multiply) // 21
print(division) // 2
print(remainder) // 1
```

### Compound Assignment Operators
```swift
// This makes it easy for us to process transactions.

var step = 9999
step += 1
step = step + 1
// Both the same transaction.

// Same way
var anyText = "Devam etmesi gereken bir metin "
anyText += "her zaman devam edebilir."
```

### Operator Overloading
```swift
// This means that you can operate not only on numbers but also on other types of variables. 
let name = "Tunahan"
let surname = "Bekdaş"
let myname = "My name is" + name + " " + surname

print(myname) // My name is Tunahan Bekdaş

// It can even be used in arrays.
let firstArray = ["One" , "Two"]
let secondArray = ["Three" , "Four"]

let totalArray = firstArray + secondArray

print(totalArray) // ["One", "Two", "Three", "Four"]
```

### Comparison Operators

```swift
let number1 = 5
let number2 = 4

print(number1 == number2) // false
print(number1 != number2) // true
print(number1 < number2) // false
print(number1 > number2) // true
print(number1 <= number2) // false
print(number1 >= number2) // true
```
### Conditions
Conditions are of great importance in the software world. It allows you to control the flow of the code you program.

```swift
let temperature = 9

if temperature > 20 {
    print("The weather is sunny and hot")
}else if temperature >= 10 {
    print("The weather is cloudy and warm")
}else{
    print("The weather is rainy or snowy and cold")
}

// The weather is rainy or snowy and cold
// This is the result because the value doesn't fit any comparison
```
### Combining conditions

```swift
// Uses the conditions together
let personOneAge = 21
let personTwoAge = 17

if personOneAge > 18 && personTwoAge > 18 {
    print("You can both get a driver's license.")
}else if personOneAge > 18 || personTwoAge > 18 {
    print("Only one of you can get a driver's license.")
}else{
    print("You both can't get a driver's license.")
}
// Only one of you can get a driver's license.
```

### The Ternary Operator
```swift
// Is the same as if else. Makes it harder to read but is written shorter.
let number1 = 52
let number2 = 59

var result = number1>number2 ? "First num bigger than second" : "Second num bigger than first"
print(result) // Second num bigger than first
```

### Switch Statements
```swift
// Used to control the flow of certain expressions.
let weather = "Rainy"

switch weather {
case "Sunny":
    print("It's a beautiful day! Let's go for a picnic.")
case "Rainy":
    print("Don't forget your umbrella today!")
case "Cloudy":
    print("The weather is a bit gloomy.")
case "Snowy":
    print("Time to build a snowman!")
default:
    print("I'm not sure what the weather is like.")
}
//  Don't forget your umbrella today!
```

### Range operators
```swift
// It is used to specify a range.
let temperature = 78

switch temperature {
case ..<32:
    print("It's freezing outside!")
case 32..<60:
    print("It's chilly.")
case 60..<75:
    print("It's a comfortable temperature.")
case 75...:
    print("It's quite warm!")
default:
    print("I'm not sure about the temperature.")
}
// It's quite warm!
```

## 📖 Summary
Swift has operators for doing arithmetic and for comparison; they mostly work like you already know.
There are compound variants of arithmetic operators that modify their variables in place: +=, -=, and so on.
You can use if, else, and else if to run code based on the result of a condition.
Swift has a ternary operator that combines a check with true and false code blocks. Although you might see it in other code, I wouldn’t recommend using it yourself.
If you have multiple conditions using the same value, it’s often clearer to use switch instead.
You can make ranges using ..< and ... depending on whether the last number should be excluded or included.





















