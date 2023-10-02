# 👨🏻‍💻 Day 1 (Variables) 

The variable corresponds to holding data in programming languages.


## ⚒️ Usage 

### String and Integer

```swift 
// Variable Type is String
var name =  “Tunahan”

// Variable Type is Integer
var number =  22

print(name) // Tunahan
print(number) // 22

// If you wanna change the value, you don't need "var" tag
name =  “Ahmet”
number = 7
```

### Multiline String, Double and Boolean

```swift
// Variable Type is Multiline String
var multilineText = """
I'm learning
Swift and UIKit
And This variable is
Multiline string
"""

// Variable Type is Double
var doubleNum = 22.072001 // Dot provide this

// Variable Type is Boolean
var learn = true
```

### String Interpolation

```swift
var score = 59
var scroreString = “User score is :  \(score)” //  User score is : 9 
```

### Contants 

```swift
// If you never want your variable to change. Use it
let tryChange = "Swift"
tryChange = “Kotlin // You should see a warning that 
```
### Type annotations 

```swift
// If you want to predetermine the variable type
var number : Int = 22
var name : String = “Tunahan” 
var myBoolean : Bool = false
var myDouble : Double = 22.07

// This avoids misuse of the variable

number = "22" // You can't do this. Because variable type is an integer.
name = "Ahmet" // But you can do this


number = “Ahmet” // You can't do this. Because variable type is an integer.
number = 10 // But you can do this
```

### Multi-line strings

```swift

var str1 = """
This goes
over multiple
lines
"""
 
OUTPUT:
 This goes
 over multiple
 lines

var str2 = """
This goes \
over multiple \
lines
"""
OUTPUT:
This goes over multiple lines
```


## 📖 Summary

1. You make variables using var and constants using let. It’s preferable to use constants as often as possible.
2. Strings start and end with double quotes, but if you want them to run across multiple lines you should use three sets of double quotes.
3. Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false.
4. String interpolation allows you to create strings from other variables and constants, placing their values inside your string.
5. Swift uses type inference to assign each variable or constant a type, but you can provide explicit types if you want.



