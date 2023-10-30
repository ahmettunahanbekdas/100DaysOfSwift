//
//  SecondViewController.swift
//  Project  7- AlertProject
//
//  Created by Ahmet Tunahan Bekdaş on 30.10.2023.
//

import UIKit

class SecondViewController: UIViewController {

    var userNames = ""
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = "Welcome \(userNames)"
        
    }
    



}
