//
//  ViewController.swift
//  ChangeImage
//
//  Created by Ahmet Tunahan Bekdaş on 25.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    var isImageDisplay = true
    var isLabelDisplay = true
    
    override func viewDidLoad() {
    }
    
    @IBAction func changeClick(_ sender: Any) {
        
        if isImageDisplay {
            imageView.image = UIImage(named: "sadElon")
        }else{
            imageView.image = UIImage(named: "happyElon")
        }
        isImageDisplay = !isImageDisplay
        
        
        if isImageDisplay {
            labelText.text = "Elon is Happy"
        } else {
            labelText.text = "Elon is Sad"
        }
        isLabelDisplay = !isImageDisplay
    }
    
}

