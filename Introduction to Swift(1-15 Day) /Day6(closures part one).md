# 👨🏻‍💻 Day 6

## 📖 Closures-part one 
It is a special operation similar to the assignment but functionalizing.

## ⚒️  Usage 

### Basic Closures
```swift
let hello = {
  print("Hi")
}

hello() // Hi
```

### Accepting Parameters
```swift
// Since they are functions, of course they can take parameters.
let example = { (firstString: String, secondString: String) in
    print(firstString + secondString)
}

example("Hello, this is my custom text:", " We use indexes instead of names.") // Hello, this is my custom text: We use indexes instead of names.

```

### Returning Closures

let iReturn = { (message: String) -> String in
    return "Your message: \(message) \nI'll get back to you soon." // "\n" allows for a line break
}

let result = iReturn("Where are you?")
print(result)
// Your message: Where are you?
// I'll get back to you soon.

### Closures as Parameters
```swift
let exampleClos = { 
    print("I am now the parameter")
}

func funcExample(clos: () -> Void) {
    print("What?")
    clos()
}

funcExample(clos: exampleClos) // The closure is now the parameter.

```
### Trailing Closure Syntax 🤯
```swift
// Remove this 
let exampleClos = { 
    print("I'm actually parameter")
}

func funcExample(clos: () -> Void) {
    print("What?")
    clos()
}

funcExample(){
  print("I'm actually parameter")
}

// This part cannot be used when there is more than one parameter.
funcExample{
  print("I'm parameter")
}

// You can use it however you want.
// But I think it's complicated and reduces readability.
```

### Medium Article 🤯

You can access my article on Closures and Extensions from my [Medium account]().

 [File](https://medium.com/@tunahanbekdas/swift-protokol-ve-extends-2643f8cbf524)

