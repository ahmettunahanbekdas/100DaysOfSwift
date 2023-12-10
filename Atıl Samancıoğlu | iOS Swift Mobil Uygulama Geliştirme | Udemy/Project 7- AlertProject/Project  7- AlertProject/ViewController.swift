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
            makeAlert(tittle: "Error", message: "Username field cannot be empty", okActionTittle: "Okay")
        } else if password1 != password2 {
            makeAlert(tittle: "Error", message: "Passwords do not match", okActionTittle: "Okay")
        } else if  password1?.isEmpty == true && password2?.isEmpty == true {
            makeAlert(tittle: "Error", message: "Password field cannot be empty", okActionTittle: "Okay")
        } else {
            performSegue(withIdentifier: "toSecondVC", sender: nil)
        }
           
    }
    
    func makeAlert(tittle: String, message: String, okActionTittle:String) {
        // Kullanıcı adı boş değilse ama şifreler aynı değilse uyarı göster
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okActionTittle, style: .cancel, handler:  nil)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            if let SecondViewController = segue.destination as? SecondViewController {
                SecondViewController.userNames = usernameTextField.text ?? "default value"
            }
        }
    }
}


