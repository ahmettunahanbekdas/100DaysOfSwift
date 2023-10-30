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
        
        // Kullanıcının girdiği kullanıcı adı, şifreleri al
        let username = usernameTextField.text
        let password1 = passwordTextField.text
        let password2 = passwordagainTextField.text

        // Kullanıcı adı boş mu diye kontrol et
        if username?.isEmpty == true {
            let usernameAlert = UIAlertController(title: "Hata", message: "Kullanıcı adı boş geçilemez.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
            usernameAlert.addAction(okAction)
            self.present(usernameAlert, animated: true)
        } else if password1 == password2 {
            // Kullanıcı adı boş değilse ve şifreler aynıysa işlem devam edebilir
            userName = username ?? "İsim boş geçildi"
            performSegue(withIdentifier: "toSecondVC", sender: nil)
        } else {
            // Kullanıcı adı boş değilse ama şifreler aynı değilse uyarı göster
            let alert = UIAlertController(title: "Hata", message: "Şifreler uyuşmuyor. Lütfen aynı şifreyi giriniz.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Tamam", style: .cancel, handler:  nil)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
           
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            if let SecondViewController = segue.destination as? SecondViewController {
                SecondViewController.userNames = usernameTextField.text ?? "default value"
            }
        }
    }
}

