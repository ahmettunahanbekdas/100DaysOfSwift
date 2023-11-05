//
//  ViewController.swift
//  Project 13- CustomTableView
//
//  Created by Ahmet Tunahan Bekdaş on 5.11.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    struct Mans {
        var name: String
        var imageName: String
    }
    
    let data: [Mans] = [
        
        Mans(name: "Steve Jons", imageName: "steve"),
        Mans(name: "Bill Gates", imageName: "bill"),
        Mans(name: "Elon Musk", imageName: "elon"),
        Mans(name: "Mark Zuckerberg", imageName: "mark")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mans = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CutomTableViewCell
        cell.label.text = mans.name
        cell.images.image = UIImage(named: mans.imageName)
        return cell
        
    }
    
    
}
