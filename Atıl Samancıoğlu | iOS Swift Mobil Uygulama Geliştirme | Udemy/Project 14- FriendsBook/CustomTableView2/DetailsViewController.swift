//
//  DetailsViewController.swift
//  CustomTableView2
//
//  Created by Ahmet Tunahan Bekdaş on 5.11.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var selectFriends: Friends?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var jobs: UILabel!
    @IBOutlet weak var age: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = selectFriends?.image
        name.text = selectFriends?.name
        age.text = String(selectFriends!.age)
        city.text = selectFriends?.city
        jobs.text = selectFriends?.jobs
        
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        image.layer.borderWidth = 2.0
        image.layer.borderColor = UIColor.blue.cgColor
    }
    
    
    
    
    
}
