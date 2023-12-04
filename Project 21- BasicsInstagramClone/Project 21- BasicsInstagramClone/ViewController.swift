//
//  ViewController.swift
//  Project 21- BasicsInstagramClone
//
//  Created by Ahmet Tunahan Bekdaş on 4.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButton(_ sender: Any) {
        performSegue(withIdentifier: "toFeedViewController", sender: nil)
    }
    
    @IBAction func signUpPassword(_ sender: Any) {
    }
}

