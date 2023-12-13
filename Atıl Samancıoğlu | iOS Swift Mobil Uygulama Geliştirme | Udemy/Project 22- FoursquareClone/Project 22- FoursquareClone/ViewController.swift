//
//  ViewController.swift
//  Project 22- FoursquareClone
//
//  Created by Ahmet Tunahan Bekdaş on 13.12.2023.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Apple"
        parseObject["calories"] = 100
        
        parseObject.saveInBackground { succes, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }else {
                print("Uplodad")
            }
        }

        
    }


}

