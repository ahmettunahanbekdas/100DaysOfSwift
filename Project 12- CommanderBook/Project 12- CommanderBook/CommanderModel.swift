//
//  CommanderModel.swift
//  Project 12- CommanderBook
//
//  Created by Ahmet Tunahan Bekdaş on 4.11.2023.
//

import Foundation
import UIKit

class Commander {
    var name: String
    var image: UIImage
    var about: String
    
    init(name: String, image: UIImage, about: String) {
        self.name = name
        self.image = image
        self.about = about
    }
}
