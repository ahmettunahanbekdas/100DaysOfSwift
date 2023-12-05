//
//  SettingsViewController.swift
//  Project 21- BasicInstagramClone
//
//  Created by Ahmet Tunahan Bekdaş on 5.12.2023.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            // Kullanıcı başarıyla çıkış yaptıysa, belirlediğiniz başka bir sayfaya yönlendirme işlemi yapabilirsiniz.
            performSegue(withIdentifier: "toViewController", sender: nil)
            print("Log Out Succes")
        } catch let signOutError as NSError {
            print("Çıkış yaparken hata oluştu: \(signOutError.localizedDescription)")
            // Hata durumunda kullanıcıya bir bildirim veya başka bir geri bildirim yapabilirsiniz.
        }
    }
}

