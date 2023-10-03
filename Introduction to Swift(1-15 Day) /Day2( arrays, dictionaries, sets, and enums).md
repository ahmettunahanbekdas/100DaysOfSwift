# 👨🏻‍💻 Day 2

## Complex Datas And Variable Types 📖
Complex data usually refers to holding objects or lists in programming languages.

## ⚒️ Usage 

### Arrays
```swift
// Arrays is holding multiple variables together
let user1 = "Tunahan"
let user2 = "Hediye"
let user3 = "Tolga"
let user4 = "Utku"

let players = [user1,user2,user3,user4]
```

### Sets
```swift
// Sets are very similar to arrays. They are randomly sorted and hold unique items.

let cars = Set(["Mercedes", "BMW", "Audi"])
let cars2 = Set(["Mercedes", "BMW", "Audi",  "Audi", "BMW"])

print(cars) // [BMW,Mercedes,AUDI]
print(cars2) // [BMW,Mercedes,AUDI]
// Both outputs are the same. Sets ignore duplicate items
```

### Tuples 
```swift
let user = (name: "Tunahan", age: 22)
print(user.0) //Tunahan
print(user.age) //22
```

### Dictionary
```swift
let favMovie  = [
    "Tunahan" :"Fight Club",
    "Hediye" : "Insecption"
]
print(favMovie["Tunahan"]) // Optional("Fried potatoes")
//             Key                      Value

// If the key is not in dictionary use default values
print(favMovie["Tolga"]) // nill
print(favMovie["Tolga", default: "Unknown"])
// You set safety with a default value
```

### Empty Collection
```swift
// If you want an empty collection
var numbers = Array<Int>()
var numbers2 = [Int]()

var user = Dictionary<String,String>()
var user2 = [String : String]()

user["Tunahan"] = "IOS Developer"
user2["Hediye"] = "Finance"

print(user) //["Tunahan": "IOS Developer"]
print(user2) //["Heditye": "Finance"]
```

### Enumerations

```swift
let result = "Succes"
let result2 = "Failure"

enum Result {
    case success
    case fail
}

let result = Result.success
print(result) // success
// So the result can take 2 different values and we don't need 2 variables for that.
```

### Enumerations Associated Values

```swift
enum CustomResult {
    case waiting
    case success(message: String)
    case failure(errorCode: Int, errorMessage: String)
}

let result = CustomResult.failure(errorCode: 500, errorMessage: "Internal Server Error")
print(result)
```

### Enumerations Associated Values
```swift
// Used to match data
enum Days : Int {
    case monday = 2
    case tuesday
    case wednesday
    case thursday
}
let today = Days(rawValue: 3)
print(today) // Optional(Days.tuesday)
```
## 🤏🏻 Tips 

### Arrays

```swift
// The index of arrays starts from 0. So the index of the first object is 0.
let player1 = "Tunahan"
let player2 = "Hediye"
let player3 = "Tolga"
let player4 = "Arif"

let players = [player1 , player2 , player3 , player4]
//                0         1         2         3

print(players[0]) // Mehmet
print(players[1]) // Sait
print(players[4]) // This line does not give an error but will cause the program to generate a fatal error. +
// + Because the 4th object is not in the list.
```

### Sets
```swift
let cityName = Set(["Tekirdağ", "New York", "Cairo"])
```


### Tuples

```swift
// Tuple types cannot be changed
var person = (name: "Tunahan", job: "Developer")
var person = (name: "Tunahan", age :22) // You can't do this. As long as this line exists, you will get an error.
```

```swift
// But its values can be changed
var person = (name: "Tunahan", age: 22)
print(person.1) // 22

person.age = 23
print(person.1) // 23
```

### Empty Collections

```swift
// You will add objects to your array later
var persons = [String]() // Create a empty list with type filter.
persons.append("Tunahan") // It works fine
persons.append(1) // Xcode warns you and won't let you do this
```

```swift
var anyCity = [Any]() // If the variable type is unknown or unimportant, accept any.
// All lines works fine
anyObject.append(59)
anyObject.append("Tekirdağ")
anyObject.append(true)
```

## 📖 Summary

1. Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
2. Arrays store items in the order you add them, and you access them using numerical positions.
3. Sets store items without any order, so you can’t access them using numerical positions.
4. Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
5. Dictionaries store items according to a key, and you can read items using those keys.
6. Enums are a way of grouping related values so you can use them without spelling mistakes.
7. You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.





















