//
//  DetailViewController.swift
//  Project 12- CommanderBook
//
//  Created by Ahmet Tunahan Bekdaş on 4.11.2023.
//

import UIKit

class DetailViewController: UIViewController {
 
    @IBOutlet weak var commanderName: UILabel!
    @IBOutlet weak var commanderImage: UIImageView!
    @IBOutlet weak var commanderAbout: UILabel!
     
    var selectedCommander : Commander?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commanderName.text = selectedCommander?.name
        commanderImage.image = selectedCommander?.image
        commanderAbout.text = selectedCommander?.about
    }

}
