//
//  ViewController.swift
//  Project  7- AlertProject
//
//  Created by Ahmet Tunahan Bekdaş on 30.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var userName = ""

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordagainTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signupButton(_ sender: Any) {
        // Kullanıcının girdiği şifreleri al
        let password1 = passwordTextField.text
        let password2 = passwordagainTextField.text
        
        // Şifrelerin aynı olup olmadığını kontrol et
        if password1 == password2 {
            userName = usernameTextField.text ?? "İsim boş geçildi"
            performSegue(withIdentifier: "toSecondVC", sender: nil)
        } else {
            // Şifreler aynı değilse uyarı göster
            let alert = UIAlertController(title: "Hata", message: "Şifreler uyuşmuyor. Lütfen aynı şifreyi giriniz.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}

