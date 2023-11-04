//
//  DetailViewController.swift
//  Project 12- CommanderBook
//
//  Created by Ahmet Tunahan Bekdaş on 4.11.2023.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var commanderName: UILabel!
    @IBOutlet weak var commanderImage: UIImageView!
    @IBOutlet weak var commanderAbout: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

 
}
