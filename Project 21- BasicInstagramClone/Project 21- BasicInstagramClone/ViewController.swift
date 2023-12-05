//
//  ViewController.swift
//  Project 21- BasicInstagramClone
//
//  Created by Ahmet Tunahan Bekdaş on 4.12.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    //MARK: - @IBOutlets

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    
    //MARK: - signInButton
    
    @IBAction func signInButton(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authData, error in
                if  error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                    print("sign in error")
                }else {
                    self.performSegue(withIdentifier: "toFeedViewController", sender: nil)
                    print("sign in user")
                }
            }
        }else {
            makeAlert(title: "Error", message: "Please Enter Email and Password")
        }
    }
    
    
    //MARK: - signUpButton

    @IBAction func signUpButton(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authData, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedViewController", sender: nil)
                }
            }
        }else{
            makeAlert(title: "Error", message: "Please Enter Username and Password")
        }
    }
    
    func makeAlert(title: String, message:String) {
        let alert = UIAlertController(title: title, message: message , preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

