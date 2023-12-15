//
//  PlacesModel.swift
//  Project 22- FoursquareClone
//
//  Created by Ahmet Tunahan Bekdaş on 15.12.2023.
//

import Foundation
import UIKit

class PlacesModel {
    
    static let shared = PlacesModel()
    
    var placesName: String?
    var placesType: String?
    var placesComment: String?
    var placesImage: UIImageView?
    
    private init(){}
}
