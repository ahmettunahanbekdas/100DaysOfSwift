👨🏻‍💻 Day 15

📖 Summary - 2

- Properties
- Static properties and methods
- Access control
- Polymorphism and typecasting
- Closures

## Properties

```swift
struct Person {
    var clothes: String
    var shoes: String

    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

var tunahan = Person(clothes: "Sweatshirt", shoes: "Boot")
let hediye = Person(clothes: "T-shirts", shoes: "sneakers")

tunahan.describe()
hediye.describe()
```

```swift
struct Person {
    
    var clothes: String{
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        didSet {
            updateUI(msg:  "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUI(msg: String) {
    print(msg)
}

var tunahan = Person(clothes: "T-shirt")
tunahan.clothes = "Sweatshirt"
```

```swift
struct Person {
    var age: Int
    
    var ageDogYears: Int{
        get  {
            return age * 3
        }
    }
}

var lux = Person(age: 20)
print(lux.ageDogYears)
```
```swift
struct Triangle {
    var edges : [Int]
    var perimeter : Int {
        get {
            var result = 0
            for i in self.edges{
                result += i
            }
            return result
        }
    }
    
}

let myTriangle = Triangle(edges: [3,4,5])
myTriangle.perimeter
```

## Static properties and methods

```swift
struct favoriteCar {
    static var carName = "Ford Mustan 1969"
    
    var userName: String
    var age: Int
}

var tunahan = favoriteCar(userName: "Tunahan", age: 22)
print(favoriteCar.carName)
```

## Acces Control

```swift
class Till {
     var money : Double
    
    init(money : Double){
        self.money = money
    }
}

var myTill = Till(money: 2_000_000.0)

class Till2 {
     var money : Double
    
    init(money : Double){
        self.money = money
    }
}


var myTill2 = Till(money: 2_000_000.0)
myTill.money
```

## Polymorphism and typecasting

```swift

class car {
    var model: String
    
    init(model: String)  {
        self.model = model
    }
    
    func cars() -> String  {
        return "Car model \(model)"
    }
}

class sportCar: car {
    var maxSpeed: Int
    
    init(maxSpeed: Int, model: String){
        self.maxSpeed = maxSpeed
        super.init(model: model)
    }
    
    override func cars() -> String {
        return "Sport Car Model \(model)"
    }
}


class classicCar: car {
    var date: Int
    
    init(model: String, date: Int){
        self.date = date
        super.init(model: model)
    }
    
    override func cars() -> String {
        return "Classic Car Model \(model)"
    }
}

var mercedes = sportCar(maxSpeed: 280, model: "A3 AMG")
var ford = classicCar(model: "Mustang", date: 1969)
var bmw = classicCar(model: "E63", date: 1987)

var allCars: [car] = [mercedes, ford, bmw]

for car in allCars {
    print(car.model)
}
```

##  More Detail

```swift

class Album {
    var name: String

    init(name: String) {
        self.name = name
    }

    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String

    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String

    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
    
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.name)
    }else if let liveAlbum = album as? LiveAlbum    {
        print(liveAlbum.location)
    }
}



for album in allAlbums {
    let studioAlbum = album as! StudioAlbum
    print(studioAlbum.studio)
}

var number2 = 5
var sNumer2 = String(number2)

```

### Converting common types with initializers
```swift
let number = 5

let textNumber = String(number)
```

## Closures
```swift
let vw = UIView()

UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})
```
```swift
let vw = UIView()

UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
```



