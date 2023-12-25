//
//  MusicianClass.swift
//  Project 25- AdvancedSwiftProject
//
//  Created by Ahmet Tunahan Bekdaş on 23.12.2023.
//

import Foundation


class MusicianClass{
    
    var name : String
    var age: Int
    var insturment : String
    
    init(nameInput: String, ageInput: Int, insturmentInput: String) {
        self.name = nameInput
        self.age = ageInput
        self.insturment = insturmentInput
    }
    
    func agePlus(){
        age += 1
    }
}





