### 👨🏻‍💻 Day 12 

## 📖 Optionals
In the presence of empty values, options can save our lives. We can say that it is used to determine the value to be assigned instead of empty data.

### Handling missing data

```swift

// Here, we added a question mark to the end of our data type and
// said that this value may be empty in our data.

var age: Int? = nil
age = 22

// And then be able to fill that value
```


### Unwrapping Optionals

```swift
var name: String? = nil

if let unwrapped = name {
    print(unwrapped.count)
} else {
    print("None") // None
}
```

```swift
var name: String? = nil
name = "Tunahan"

if let unwrapped = name {
    print(unwrapped.count) // 7
} else {
    print("None")
}
```


### Unwrapping With Guards
```swift

func User(_ name: String?) {
    guard let unwrapped = name else { // In this code, only this place is executed
        return                        // and the following code is not executed.
    }
    print("\(unwrapped) sign in !!!")
}

let name: String? = nil
User("Tunahan")
```

```swift

// in "if let"
func User2 (_ name: String?) {
    if let unwrapped = name {
        print("\(unwrapped) sign in twice !!!")
    } else {
        print("None")
    }
}

var name2: String? = nil
User2("Tunahan") // Tunahan sign in twice !!!
```

### Force Unwrapping

```swift
// If you are sure your code is not empty

let age = "22" // For example like here
let tunahanAge = Int(age)! // You can force this action

// But if this operation fails, the application will crash.
// Therefore, operations should only be forced on values we are sure of.
```

### Implicitly Unwrapped Optionals
```swift
// You can think of it as forcing a value unwrapping
// But it does this without using "if let" or "guard let"

var age : Int! = nil // They can take a null value but you need to make sure they will get a value before using it.
// Because your code will crash if the value is empty when you use
```




### Nil coalescing
```swift
// If id is not found here an empty value will be returned
func userName(_ id:Int) -> String? {
    if id == 59 {
        return "Hi \(id)"
    }else {
        return nil
    }
}

let userTunahan = userName(12) ?? "None"// And Here, if the value is empty, we want it to be written as anonymous.
                                        // So our user's type is now a non-optional string
```


### Optional Chaining

```swift
var names: [String] = ["Tunahan", "Hediye", "Tolga", "Arif"]
let beatle = names.first?.uppercased() //  line works fine  TUNAHAN

names.removeAll()

let beatle2 = names.first?.uppercased() // return nil
```


### Optional Try

```swift
//  Seen these codes before
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
```

### Optional try
```swift
// We've seen these codes before
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
```
```swift
// Now let's see how to use it as optional
if let result = try? checkPassword("password") { // Here if the operation is an error the result will be nil and the "else" part will work
    print("Result was \(result)")
} else {
    print("D'oh.")
}
```
```swift
// Also, if we're sure 
try! checkPassword("Top Secret") // It can be forced
print("OK!")
// But if the error is received your code will crash.
```

### Failable initializers
```swift
// If you need an object with certain properties like an ID number
struct Person {
    var id: String

    init?(id: String) { // Failed initializers are for you
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}
```

### Typecasting

```swift
// Consider classes that inherit from a class
class Animal { }
class Fish: Animal { }

class Dog: Animal { // And only one of these classes has a unique function
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()] // This created array contains animal elements

// Since fish can't make a sound, we want dogs to make sounds.
for pet in pets {
    if let dog = pet as? Dog { // So only dog breeds have sound making function
        dog.makeNoise()
    }
}
```





