//
//  main.swift
//  Project 25- AdvancedSwiftProject
//
//  Created by Ahmet Tunahan Bekdaş on 23.12.2023.
//

import Foundation



let tunahanClass = MusicianClass(nameInput: "Tunahan", ageInput: 22, insturmentInput: "Bağalama")
//print(tunahanClass.age)

var tunahanStruct = MusicianStruct(name: "Tunahan", age: 22, enstrument: "Kanun")
//print(tunahanStruct.age)


// IMMUTABLE STRUCT

tunahanClass.age = 32
//print(tunahanClass.age)

tunahanStruct.age = 32
//print(tunahanStruct.age)


// REFERANCE VS VALUE

let copyOfTunahanClass = tunahanClass
var copyOfTunahanStruct = tunahanStruct

//print(copyOfTunahanClass.age)
//print(copyOfTunahanStruct.age)

copyOfTunahanClass.age = 42
//print(tunahanClass.age)

copyOfTunahanStruct.age = 42
//print(tunahanStruct.age)

// Refeance Type -> Class
// Copy -> Same object new referances -> 1 object 2 Referance

// Value Type -> Struct
// Copy -> New object -> 2 object





//print(tunahanClass.age)
//tunahanClass.agePlus()
//print(tunahanClass.age)


//print(tunahanStruct.age)
//tunahanStruct.agePlus()
//print(tunahanStruct.age)



// TUPLES

//let myTuples = (1,4)
//print(myTuples.0)
//print(myTuples.1)
//
//
//var myTuples2 = (1,4,7)
//print(myTuples2.2)
//
//myTuples2.2 = 7
//print(myTuples2.2)
//
//
//var myTuples3 = (1, [2,3,4])
//print(myTuples3.1[2])
//
//var predifined : (String, String)
//
//predifined.0 = "Tunahan"
//predifined.1 = "Bekdaş"
//
//print(predifined)
//
//let newTuple = (name:"Tunahan", age:22)
//print(newTuple.age)
//print(newTuple.name)




// İf let VS Guard let

//let myNumber = "5"
//
//func turnToIntIfLet(myValue:String) -> Int{
//    if let ifIntValue = Int(myValue){
//        return ifIntValue
//    } else {
//        return 0
//    }
//}
//
//func turnToGuardLet(myValue:String) -> Int {
//    guard let guardIntValue = Int (myValue) else{
//        return 0
//    }
//    return guardIntValue
//}
//
//print(turnToGuardLet(myValue: myNumber))
//print(turnToIntIfLet(myValue: myNumber))





// Switch

// Remainder

//let myNum = 14
//
//let remainder = myNum % 3
//
//print(remainder)


//if (remainder == 1){
//    print("it's 1")
//}else if(remainder == 2){
//    print("it's 2")
//}


//switch remainder{
//case 1:
//    print("it's z1")
//case 2:
//    print("it's 2")
//default:
//    print("Wrong")
//}





// BREAKPOİNT


