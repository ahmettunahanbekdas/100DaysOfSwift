# 👨🏻‍💻 Day 14

## 📖 Summary - 1 

- Functions
- Optionals
- Optional chaining
- Enumaretion
- Struct
- Classes

## Functions
```swift
func startSwift() {
  print("I'm learning Swift.")
}

startSwift()
```

```swift
func iLearn(what lang : String){
    print("I'm learning \(lang).")
}

iLearn(what: "Swift")
```
```swift
func PeopleAge (name: String, age: Int){
    print("\(name) is \(age) years old")
}

var Tunahan = PeopleAge(name: "Tunahan", age: 22)
var Hediye = PeopleAge(name: "Hediye", age: 23)
```
```swift
func live(_ city: String) {
    print("I live \(city)")
}

live("Istanbul")
```

```swift
func myHobbies(name: String) -> Bool {
    if name == "Cheese" { return true }
    if name == "Code" { return true}
    
    return false
}

myHobbies(name: "Code") //true
```

## Enumaretion
```swift
enum State {
    case bored
    case happy
    case sad
}

func yourState(for state: State) {
    print("Your state \(state)")
}

yourState(for: State.bored)
```
```swift
func getHaterStatus(weather: weatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
            return "dislike"
    case .rain, .snow:
            return "hate"
    }
}

getHaterStatus(weather: .wind(speed: 12))
```

## Struct 
```swift
struct user {
    var name : String
    var surname : String
    var age : Int?
}

let tunahan = user(name: "Tunahan", surname: "Bekdaş", age: 22)

print(tunahan.age) // 22
```
```swift
struct user {
    var name : String
    var surname : String
    var age : Int?
    
    func fullName(){
        print(name + " " + surname)
    }
}


let tunahan = user(name: "Tunahan", surname: "Bekdaş", age: 22)
var tunahanCop = tunahan

tunahanCop.name = "TunahanCop"

print(tunahan.name)
tunahan.fullName()
print(tunahanCop.name)
tunahanCop.fullName()
```
## Classes 
```swift
class User {
    var name: String
    var surname: String
    var age: Int?
    
    init(name: String, surname: String, age: Int? ) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    func fullName() {
        print(name + " " + surname)
    }
}

var tunahan = User(name: "Tunahan", surname: "Bekdaş", age: 22)

tunahan.name
tunahan.surname
tunahan.fullName()

class Person: User, Identifiable {
    var id = UUID()
    
    override func fullName() {
        print("My id \(id), name is \(name), surname is \(surname)")
    }
}

var tunahan2 = Person(name: "Tunahan", surname: "Bekdaş", age: 22)
tunahan2.fullName()
```
## Struct VS Classes

### Structures have an initializer. You have to create your own for Classes

```swift
struct StructUser {
    var name: String
}
let user1 = StructUser(name: "Struct User")
```

```swift
class ClassUser {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let user2 = ClassUser(name: "Class User")
```

### Structure is a value type. Class is a reference type.

### If we copy "user1"
```swift
let user1 = Suser(name: "User1")
var user1Copy = user1

user1Copy.name = "User1Copy"

print(user1.name) // User1
print(user1Copy.name) // User1Copy
```
### But If we copy "user2"
```swift
var user1Copy = user1
user1Copy.name = "x"

user1.name
user1Copy.name

var user2Copy = user2
user2Copy.name = "y"

user2.name
user2Copy.name
```
<img src="https://miro.medium.com/max/940/1*N4CTsUuCT8mu7k2YlADqxQ.gif">

### Classes can inherit. Structures can't.

```swift
We can easily use the class properties we created earlier in classes.We can add property on it and we get a new class type.

class Car {
    var name: String
    var model: Int
    var color: String
    var hp: Int
    
    init(name: String, model: Int, color: String, hp: Int) {
        self.name = name
        self.model = model
        self.color = color
        self.hp = hp
    }
}

class ClassicCar: Car {
    var price: Double
    
    init(name: String, model: Int, color: String, hp: Int, price: Double) {
         self.price = price
         super.init(name: name, model: model, color: color, hp: hp)
    }
}

var mustang69 = ClassicCar(name: "Ford", model: 1969, color: "Black", hp: 300, price: 230.800)
```










