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
let user = (name: Tunahan, age: 22)
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

