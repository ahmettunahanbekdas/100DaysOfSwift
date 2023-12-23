//
//  SecondViewController.swift
//  Project 6- SegueApp
//
//  Created by Ahmet Tunahan Bekdaş on 28.10.2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondViewControllerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var myNames = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myNames
        
    }
}
