//
//  SettingsViewController.swift
//  Project 21- BasicInstagramClone
//
//  Created by Ahmet Tunahan Bekdaş on 5.12.2023.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - logOutButton
    @IBAction func logOutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
            print("Log Out Succes")
        } catch let signOutError as NSError {
            print("Çıkış yaparken hata oluştu: \(signOutError.localizedDescription)")
        }
    }
}

