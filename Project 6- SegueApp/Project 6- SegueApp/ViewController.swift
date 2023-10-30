//
//  ViewController.swift
//  Project 6- SegueApp
//
//  Created by Ahmet Tunahan Bekdaş on 28.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var userName: String = ""

    @IBOutlet weak var viewControllerLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad is called")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear is called")
    }
 
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear is called")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear is called")
        nameTextField.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear is called")
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        userName = nameTextField.text ?? "İsim boş geçildi"
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myNames = userName
        }
    }
    
}

 
