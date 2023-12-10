//
//  ViewController.swift
//  Project 8- GestureRecognizerApp
//
//  Created by Ahmet Tunahan Bekdaş on 31.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gatesImage: UIImageView!
    @IBOutlet weak var gatesLabel: UILabel!
    
    var imageControl = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        gatesImage.isUserInteractionEnabled = true
        gatesImage.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changeImage() {
        if imageControl {
            gatesImage.image = UIImage(named: "sad")
            gatesLabel.text = "Bill is sad"
        } else {
            gatesImage.image = UIImage(named: "happy")
            gatesLabel.text = "Bill is happy"
        }
        imageControl.toggle()
    }
    
}

