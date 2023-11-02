//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Ahmet Tunahan Bekdaş on 2.11.2023.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var historians = [String]()
    var historiansImages = [UIImage]()
    var chosenName = ""
    var chosenImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        historians.append("Halil İnalcık")
        historians.append("İlber Ortaylı")
        historians.append("Murat Bardakçı")
        
        historiansImages.append(UIImage(named: "halilinalcık")!)
        historiansImages.append(UIImage(named: "ilberortaylı")!)
        historiansImages.append(UIImage(named: "muratbardakcı")!)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historians.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = historians[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenName = historians[indexPath.row]
        chosenImage = historiansImages[indexPath.row]
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedName = chosenName
            destinationVC.selectedImages = chosenImage
            
        }
    }
}

