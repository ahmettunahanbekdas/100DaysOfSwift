# 👨🏻‍💻 Day 5

## 📖 Functions
Functions allow us to perform specific operations within a certain scope. Their primary purpose is to prevent code clutter for repetitive tasks.

## ⚒️ Usage 

```swift
// Let's write a simple function

func write() {
    print("I write")
}

write()

// Now every time I call write(), my message will be printed on the screen.
```

### Functions with Parameters

```swift
// If you want to choose the friends name and age, you want to print.

func addFriends(name:String, age:Int){
    print("My new friends name is \(name) and your age \(age)")
}

addFriends(name: "Tunahan", age: 21)

// But that would be an unnecessary function. Because it does the same job as print function.

func fiveTime (num : Int){
  print(num * 20)
}

fiveTime(num:2) // 40
// That makes much more sense. Because we have made a transaction.
```

### Functions Returning

```swift
// If you want to equate what you are doing with the function to a variable.
func fiveTime (num : Int) -> Int { // You need to tell in advance which type you want to return.
  return num * 20
}
let result = fiveTime(num:4)
print(result) // 80
```


### Omitting Parameter Labels

```swift
// If you want to remove parameter names.

func fiveTime (_ num : Int) -> Int { // Use _ element
  return num * 20
}
let result = fiveTime(4) // No need to enter the name "num" anymore
print(result) // 80

// However, it is not recommended for use as it reduces clarity.
```

### Default Parameters
```swift
// If you want the function to run even if no parameters are entered

func goodFriends(_ good: Bool = true){
    if good{
        print("Good Friends")
    }
    else{
        print("Bad Friends")
    }
}

goodFriends()
goodFriends(false)
// It worked without giving a parameter. When we give a parameter, the result has changed.
```

### Variadic Functions

```swift
// If the number of parameters you will enter is not clear
func toplam(number: Int...){
    var result = 0
    
    for numbers in number {
        result += numbers
    }
    print("Result: \(result)")
}

    toplam(number: 1,2,3,4,5,6,7,8,9) // Result: 45
// I can enter as many numbers as I want.
```

### Writing Throwing Functions 
```swift
// What we're doing here is to make it return an error when the "kick" string is entered into the parameter.
// These functions are important. Because they are often useful for debugging.

enum Wrong: Error {
    case down
}

func checkString(_ input: String) throws -> Bool {
    if input == "Down" {
        throw Wrong.down
    }
    return true
}

do {
    try checkString("Up")
    print("Good Time")
} catch {
    print("Bad")
}

// Good Time
```

### Inout parameters
```swift
// If you want to change a variable as it is. So

var num1 = 5

func newNum(num2: inout Int){
      num2 = 30
}

newNum(num2: &num1)
print(num1) // 30

// We did not do any assignments. But we bound the variable to the function for a while.
```


## 📖 Summary

1. Functions let us re-use code without repeating ourselves.
2. Functions can accept parameters – just tell Swift the type of each parameter.
3. Functions can return values, and again you just specify what type will be sent back. Use tuples if you want to return several things.
4. You can use different names for parameters externally and internally, or omit the external name entirely.
5. Parameters can have default values, which helps you write less code when specific values are common.
6. Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array.
7. Functions can throw errors, but you must call them using try and handle errors using catch.
8. You can use inout to change variables inside a function, but it’s usually better to return a new value.


### Medium Article 🤯

You can access my article on Closures and Extensions from my [Medium account](https://medium.com/@tunahanbekdas/swift-protokol-ve-extends-2643f8cbf524).

































