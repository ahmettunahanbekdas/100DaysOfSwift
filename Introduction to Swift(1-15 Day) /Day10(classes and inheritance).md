# 👨🏻‍💻 Day 10

## 📖 Classes 


##  ⚒️ Usage 

### Create Own Classes
```swift
// They are created like structures

class Developer{ // The only difference is the "class" keyword. For now
    var name : String
    var age : Int
    
    init(name : String, age : Int){
        self.name = name
        self.age = age
    }
}

let tunahan = Developer(name: "Tunahan", age: 22)
```

### Class inheritance
```swift
// This is important. And makes things a lot easier
class Developer{
    var name : String
    var age : Int
    var lang : String
    
    init(name : String, age : Int , lang : String){
        self.name = name
        self.age = age
        self.lang = lang
    }
}
let tunahan = Developer(name: "Tunahan", age: 22 , lang: "TR") // Main class object

class AppleDev : Developer{ // "AppleDev" class inherits from "Developer" class
    init(name : String,age : Int){
        super.init(name: name, age: 22, lang: "TR") // Elements are rendered to the new class object without affecting the other class.
    }
}

let tunahans = AppleDev(name: "Tunahan",age: 22) // Subclass object

print(tunahans.age) // 22
```

### Overriding methods 
```swift
class Developer {
    func startLearn(){
        print("Learn any lang")
    }
}
class AppleDev : Developer{
}

let tunahan = AppleDev()
mehmet.startLearn() // Learn any lang
```
```swift
class AppleDev : Developer{
    override func startLearn() {
        print("Learn Swift")
    }
}
let tunahan = AppleDev()
tunahan.startLearn() // Learn Swift
```

### Final classes 
```swift
// Creates a class that no class can inherit.

final class Person {
    var id : Int
    var name : String
    var surname : String
    
    init(id : Int , name: String , surname: String){
        self.id = id
        self.name = name
        self.surname = surname
    }
}

let mehmet = Person(id: 0, name: "Tunahan", surname: "Bekdaş")

// If you try 
class SubPerson : Person{ // Inheritance from a final class 'Person'. You can't
    init(){
        super.init(id: 0, name: "Tunahan", surname: "Bekdaş")
    }
}
```

### Copying objects
```swift
// Objects are connected to each other. Even if we did it over a copy, its name was changed.
class Car {
    var carType = "Normal"
}

var sportCar = Car()
print(sportCar.carType) // "Normal"

var copyCar = sportCar
copyCar.carType = "Sport"

print(sportCar.carType) // "Sport"
```
```swift
// What if this was a struct. No change because the duplicate object is independent of the other
struct Car {
    var carType = "Normal"
}

var sportCar = Car()
print(sportCar.carType) // "Normal"

var copyCar = sportCar
copyCar.carType = "Sport"

print(sportCar.carType) // "Normal"
print(copyCar.carType) // "Sport"
```

### Deinitializers 
```swift
class Product{
    var name = "Build"
    
    init(){
        print("\(name) can be used.")
    }
    
    func everythingGood(){
        print("Everything is ok for \(name)")
    }
    
    deinit{
        print("\(name) was destroyed")
    }
}

for _ in 0...1{
    let home = Product()
    home.everythingGood()
}

// Build can be used.
// Everything is ok for Build
// Build was destroyed
// Build can be used.
// Everything is ok for Build
// Build was destroyed
```

### Mutability 
```swift
class FavoriteSinger {
    var name = "Neşet Ertaş"
}

let singer = FavoriteSinger()
singer.name = "Aşık Veysel"
print(singer.name)

```
```swift

// If you don't want to change

class FavoriteSinger {
    let name = "Neşet Ertaş" // Simply make the variable constant
}

let singer = FavoriteSinger()
singer.name = "Aşık Veysel" // This line gives an error
print(singer.name)
```
### 🤏🏻 Summary 

1. Classes and structs are similar, in that they can both let you create your own types with properties and methods.
2. One class can inherit from another, and it gains all the properties and methods of the parent class. It’s common to talk about class hierarchies – one class based on another, which itself is based on another.
3. You can mark a class with the final keyword, which stops other classes from inheriting from it.
4. Method overriding lets a child class replace a method in its parent class with a new implementation.
5. When two variables point at the same class instance, they both point at the same piece of memory – changing one changes the other.
6. Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed.
7. Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of how the class instance was created.
