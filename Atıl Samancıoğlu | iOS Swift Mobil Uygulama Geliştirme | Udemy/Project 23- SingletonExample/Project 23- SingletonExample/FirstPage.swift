//
//  ViewController.swift
//  Project 23- SingletonExample
//
//  Created by Ahmet Tunahan Bekdaş on 19.12.2023.
//


// MARK: - FirstPage

import UIKit

class FirstPage: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userSurnameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func toSecondPageButton(_ sender: Any) {
        
        // 1. Singleton objesinin userName özelliği, userNameTextField'ten alınan değerle güncelleniyor.
        Singleton.sharedInstance.userName = userNameTextField.text
        
        // 2. Singleton objesinin userSurname özelliği, userSurnameTextField'ten alınan değerle güncelleniyor.
        Singleton.sharedInstance.userSurname = userSurnameTextField.text
        
        // 3. "toSecondPage" segue'sini çalıştırarak ikinci sayfaya geçiş yapılıyor.
        performSegue(withIdentifier: "toSecondPage", sender: nil)
    }
    
}




