# 👨🏻‍💻 Day 7

## 📖 Closures-part two 

## ⚒️ Usage 

### Using closures as parameters when they accept parameters

```swift 
// First, We need a function with parameter
func tryDriveCar (tryDrive: (String) -> Void){
    print("Drive")
    tryDrive("Drive car")
    print("Car")
}

//  Now, the queue is the how-to run this

tryDriveCar { (doIt: String) in
    print("I can \(doIt)")
}

// Drive
// I can Drive car
// Car
```

### Using closures as parameters when they return values

```swift
// First, We need a function with parameter
func tryDriveCar (tryDrive: (String) -> String) {
    print("Drive")
    let tryCar = tryDrive("Drive car")
    print(tryCar)
    print("Car")
}

//  Now, the queue is the how-to run this

tryDriveCar { (doIt: String) -> String in
   return "I can \(doIt)"
}

// Drive
// I can Drive car
// Car

```

### Shorthand parameter names
```swift
// Let's continue by shortening the above function

func tryDriveCar (tryDrive: (String) -> String) {
    print("Drive")
    let drive = tryDrive ("Drive Car")
    print(drive)
    print("Car")
}

tryDriveCar { (doIt: String) -> String in
    return "I can \(doIt)"
}

// Now let's see how to write it shorter

tryDriveCar { doIt -> String in
    return "I can \(doIt)"
}

// One more. Because Swift know this closure must be return string

tryDriveCar(){ doIt in
    return "I can \(doIt)"
}

// One more. Because Swift know this closure must be return

tryDriveCar(){ doIt in
    "I can \(doIt)"
}

// And last one. Since the parameters are sequential, we can call the first parameter 0.

tryDriveCar {
    "What's going on. \($0)"
}

// Every result is the same but code readability... Not sure about that.
```

### Closures with multiple parameters
```swift
// Okay lets try with multiple parameter

func tryDriveCar (tryDrive:(String, Int) -> String) {
    print("Drive")
    let tryCar = tryDrive("Drive car", 22 )
    print(tryCar)
    print("Car")
}


tryDriveCar{
    "I can \($0) \($1) Model BMW"
}


// I also wrote another way. I think this type is best
tryDriveCar {(myText, myModel) in
    "\(myText) \(myModel) "
}

// I can Drive car 22 Model BMW

// Drive
// Drive car 22 
// Car

```

### Returning closures from functions 
```swift
func clousureFunc() -> (String) -> Void { // This syntax is too confusing. But the first arrow is returned by our function.
    return { myText in
      print("clousure parameter is :  \(myText)")
    }
}

// How to use this?

let callFunc = clousureFunc()
callFunc("Tried")
// clousure parameter is :  Tried

// Or. As you wish

let callFunc2 = clousureFunc()("Tried 2")
// clousure parameter is :  Tried 2
```


### Capturing values
```swift
// This is so easy.
var funcCount = 0
func clousureFunc() -> (String) -> Void {
    var count = 0
    funcCount += 1
    print("Func called \(funcCount) times")
    return { myText in
      count += 1
      print("clousure parameter is :  \(myText) and count : \(count)")
    }
}

let result = clousureFunc()
result("One")
result("Two")
result("Three")

// Func called 1 times
// clousure parameter is :  One and count : 1
// clousure parameter is :  Two and count : 2
// clousure parameter is :  Three and count : 3

// If I call the function second time

let result2 = clousureFunc()
// It is added to the output.
// Func called 2 times 
```
