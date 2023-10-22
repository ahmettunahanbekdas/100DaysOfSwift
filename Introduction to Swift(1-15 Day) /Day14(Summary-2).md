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

## Struct ⚠️
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















