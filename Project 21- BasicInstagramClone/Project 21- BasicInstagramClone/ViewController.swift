//
//  ViewController.swift
//  Project 21- BasicInstagramClone
//
//  Created by Ahmet Tunahan Bekdaş on 4.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInButton(_ sender: Any) {
        performSegue(withIdentifier: "toFeedViewController", sender: nil)
        
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
    }
    
}

