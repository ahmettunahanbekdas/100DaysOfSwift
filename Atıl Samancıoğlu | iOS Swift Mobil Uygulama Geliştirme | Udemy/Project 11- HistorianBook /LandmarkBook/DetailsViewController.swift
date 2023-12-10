//
//  DetailsViewController.swift
//  LandmarkBook
//
//  Created by Ahmet Tunahan Bekdaş on 3.11.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    var selectedName = ""
    var selectedImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedName
        imageLabel.image = selectedImages
    }
}
