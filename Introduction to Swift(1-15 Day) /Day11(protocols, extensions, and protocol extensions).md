### 👨🏻‍💻 Day 11


## 📖 Protocols and extensions 
Protocols are about things we want to be used in common.

### Create 
```swift

protocol Identifiable { 
    var id: String { get set } // We have a property called id
}

struct User: Identifiable {
    var id: String //  We have a structure with the id property
}

func displayID(thing: Identifiable) { // And here a struct with id property is requested.
    print("My ID is \(thing.id)")
}

displayID(thing: User.init(id: "Tunahan")) // And here a struct with id property is passed to it
```

### Protocol inheritance 
```swift
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { } // Our new protocol inheriting from 3 different protocols.

struct Work : Employee{ // In this structure, we use the inherited protocol
// And Xcode automatically creates the functions we need to create for us.

    func calculateWages() -> Int {
        return 4000
    }
    
    func study() {
        print("Working")
    }
    
    func takeVacation(days: Int) {
        print("You have \(days) days vacation")
    }
}


let tunahan = Work() 

tunahan.calculateWages() // 4000
tunahan.study() // Working
tunahan.takeVacation(days: 15) // You have 15 days vacation
```

### Extensions
```swift
// Extensions allow you to add features to an existing type.

extension Double {
    func multiply(times : Double) -> Double {
        return self * times
    }
}
let num1 = 5.0
print(num1.multiply(times: 10)) // 100
// We've added a multiplication feature to the Double type

// And we also added factorial calculation
extension Double {
    func factorial() -> Double {
        let number = self
        var result = 1.0
        for i in 1...Int(number){
            result *= Double(i)
        }
        return result
    }
}

print(num1.factorial()) // 120
```

### Protocol extensions 
```swift
// Let's explain again through hackingwithswift example
// Since sequences and series are collected under the collections protocol in swift,
// we can create a feature to be used for both by adding an extension to the collection protocol.

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])


extension Collection { // So we can use this plugin in both types
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

// Works well on both
pythons.summarize()
beatles.summarize()
```

### Protocol-oriented programming (POP)
```swift
// This is a really difficult subject to understand.
// So for sure, I suggest you listen to this part and then do the questions.

protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identify() {
        print("My ID is \(id).") // Preparing the function for automatic id creation 
    }
}

struct User: Identifiable { // So look at this struct
    // It doesn't have such function but it has inheritance and that inheritance also has a plugin
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify() // So that the extension of that inheritance can be used in the objects of this structure.
```
### 🤏🏻 Summary
1. Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
2. You can build protocols on top of other protocols, similar to classes.
3. Extensions let you add methods and computed properties to specific types such as Int.
4. Protocol extensions let you add methods and computed properties to protocols.
5. Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations.
