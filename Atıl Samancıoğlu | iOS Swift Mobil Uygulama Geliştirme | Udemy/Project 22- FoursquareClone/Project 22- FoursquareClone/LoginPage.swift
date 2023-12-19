//
//  ViewController.swift
//  Project 22- FoursquareClone
//
//  Created by Ahmet Tunahan Bekdaş on 13.12.2023.
//

import UIKit
import Parse

class LoginPage: UIViewController {

    // MARK: - @IBOutlet
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
/*
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Orange"
        parseObject["calories"] = 140
        
        parseObject.saveInBackground { succes, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }else {
                print("Uplodad")
            }
        }

        
        let query = PFQuery(className: "Fruits")
        query.whereKey("name", equalTo:"Orange")
        query.findObjectsInBackground { object, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }else{
                print(object!)
            }
        }
 */
        passwordTextField.isSecureTextEntry = true

    }
    
    // MARK: - signInButton

    @IBAction func signInButton(_ sender: Any) {
        // Kullanıcı adı (username) ve şifre (password) alanları dolu mu kontrol et.
        if let userName = userNameTextField.text, let password = passwordTextField.text, !userName.isEmpty, !password.isEmpty {
            // Parse üzerinden giriş yap.
            PFUser.logInWithUsername(inBackground: userName, password: password) { user , error in
                if let error = error {
                    // Giriş başarısız oldu, hata mesajını göster.
                    self.makeAlert(title: "Error", message: error.localizedDescription)
                } else {
                    // Giriş başarılı oldu, istediğin işlemleri gerçekleştir ve bir segue ile yönlendirme yapabilirsin.
                    self.performSegue(withIdentifier: " toPlaces", sender: nil)
                    print("Login Successful")
                }
            }
        } else {
            // Kullanıcı adı ve şifre alanları boşsa hata mesajını göster.
            makeAlert(title: "Error", message: "Please Enter Email and Password")
        }
    }

    
    
    // MARK: - signUpButton

    @IBAction func signUpButton(_ sender: Any) {
       
        if userNameTextField.text != "" && passwordTextField.text != "" {
            let user = PFUser()
            user.username = userNameTextField.text
            user.password = passwordTextField.text

            
            user.signUpInBackground { succes, error in
                if let error = error {
                    self.makeAlert(title: "Error", message: error.localizedDescription)
                }else {
                    self.performSegue(withIdentifier: " toPlaces", sender: nil)
                    print("Succes")
                }
            }
        }else {
            makeAlert(title: "Error", message: "Please Enter Email and Password")
        }
    }
}


// MARK: - makeAlert

extension UIViewController {
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Okay", style: .default) { _ in
            // Eğer bir işlem yapmanız gerekiyorsa buraya ekleyebilirsiniz.
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

    
    

