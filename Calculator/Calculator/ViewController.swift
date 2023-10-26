//
//  ViewController.swift
//  Calculator
//
//  Created by Ahmet Tunahan Bekdaş on 26.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var wrongTypeLabel: UILabel!
    
    var result: Int
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func plusButton(_ sender: Any) {
        if let firstNumber = Int(firstNum.text!) {
            if let secondNumber = Int(secondNum.text!) {
                let result = firstNumber + secondNumber
                
                resultLabel.text = String(result)
                wrongTypeLabel.text = ""
            }else {
                wrongTypeLabel.text = "Second Number Wrong Type"
            }
        } else {
            wrongTypeLabel.text = "First Number Wrong Type"
        }
    }

    @IBAction func minusButton(_ sender: Any) {
        if let firstNumber = Int(firstNum.text!) {
            if let seconNumber = Int(secondNum.text!) {
                let result = firstNumber - seconNumber
                
                resultLabel.text = String(result)
                wrongTypeLabel.text = ""
            }else {
                wrongTypeLabel.text = "Second Number Wrong Type"
            }
        } else {
            wrongTypeLabel.text = "First Number Wrong Type"
        }
    }

    
    @IBAction func  divideButton(_ sender: Any)  {
        if let firstNumber = Int(firstNum.text!) {
            if let seconNumber = Int(secondNum.text!) {
                let result = firstNumber / seconNumber
                
                resultLabel.text = String(result)
                wrongTypeLabel.text = ""
            }else {
                wrongTypeLabel.text = "Second Number Wrong Type"
            }
        } else {
            wrongTypeLabel.text = "First Number Wrong Type"
        }
    }
    
    @IBAction func  multiplyButton(_ sender: Any) {
        if let firstNumber = Int(firstNum.text!) {
            if let seconNumber = Int(secondNum.text!) {
                let result = firstNumber * seconNumber
                resultLabel.text = String(result)
                wrongTypeLabel.text = ""
            }else {
                wrongTypeLabel.text = "Second Number Wrong Type"
            }
        } else {
            wrongTypeLabel.text = "First Number Wrong Type"
        }
    }
}

