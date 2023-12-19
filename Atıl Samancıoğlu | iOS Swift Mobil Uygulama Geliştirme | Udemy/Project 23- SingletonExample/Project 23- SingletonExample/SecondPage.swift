//
//  SecondPage.swift
//  Project 23- SingletonExample
//
//  Created by Ahmet Tunahan Bekdaş on 19.12.2023.
//


// MARK: - secondPage

import UIKit

class SecondPage: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userSurnameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Kullanıcı adını gösteren UILabel, Singleton objesinden alınan userName değeri ile güncelleniyor.
        userNameLabel.text = "USER NAME: \(Singleton.sharedInstance.userName!)"
        
        //2. Kullanıcı soyadını gösteren UILabel, Singleton objesinden alınan userSurname değeri ile güncelleniyor.
        userSurnameLabel.text = "USER SURNAME: \(Singleton.sharedInstance.userSurname!)"
    }

}




