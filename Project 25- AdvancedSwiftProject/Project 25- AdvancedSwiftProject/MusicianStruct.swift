//
//  MusicianStruct.swift
//  Project 25- AdvancedSwiftProject
//
//  Created by Ahmet Tunahan Bekdaş on 23.12.2023.
//

import Foundation

struct MusicianStruct{
    var name : String
    var age : Int
    var enstrument : String
    
    mutating func agePlus() {
        age += 1
    }
}
