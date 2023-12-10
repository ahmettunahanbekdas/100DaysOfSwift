//
//  DetailViewController.swift
//  Project 13- CustomTableView
//
//  Created by Ahmet Tunahan Bekdaş on 5.11.2023.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var aboutLabel: UILabel!
    
    var selectedMan : Mans?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedMan?.name
        imageView.image = selectedMan?.image
        aboutLabel.text = selectedMan?.about
        
    }
    

}
