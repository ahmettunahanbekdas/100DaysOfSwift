//
//  ViewController.swift
//  Project 4- ObjectWithCode
//
//  Created by Ahmet Tunahan Bekdaş on 27.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel = UILabel()
    var myButton = UIButton()
    
    var counter = 0 // Başlangıç değeri
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        myLabel.text = "Test Label"
        myLabel.textColor = .blue
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.5 - width * 0.8 / 2, y: height * 0.5 - 50 / 2 , width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        myButton.setTitle("Test Button", for: .normal)
        myButton.setTitleColor(UIColor.blue, for: .normal)
        myButton.backgroundColor = UIColor.red
        myButton.frame = CGRect(x: Int(width * 0.5 - 200 / 2), y: Int(height * 0.6 - 100 / 2), width: 200, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(myAction), for: .touchUpInside)
    }
    
    @objc func myAction() {
        counter += 1 
        myLabel.text = "\(counter)"
    }
}
