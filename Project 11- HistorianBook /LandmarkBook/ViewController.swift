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
        
        historians.append("Zeli Velidi Togan")
        historians.append("Ali Reşad")
        historians.append("Halil İnalcık")
        historians.append("İlber Ortaylı")
        historians.append("Reha Oğuz Türkkan")
        historians.append("Murat Bardakçı")
        historians.append("Erhan Afyoncu")
        

        
        historiansImages.append(UIImage(named: "zeliveliditogan")!)
        historiansImages.append(UIImage(named: "aliresad")!)
        historiansImages.append(UIImage(named: "halilinalcık")!)
        historiansImages.append(UIImage(named: "ilberortaylı")!)
        historiansImages.append(UIImage(named: "rehaoguzturkkan")!)
        historiansImages.append(UIImage(named: "muratbardakcı")!)
        historiansImages.append(UIImage(named: "erhanafyoncu")!)

        
        
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presentDeletionFailsafe(indexPath: indexPath)
        }
    }
    
    // delete cell
    func presentDeletionFailsafe(indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: "Are you sure you'd like to delete \(historians[indexPath.row])", preferredStyle: .alert)

        // yes action
        let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
            // replace data variable with your own data array
            self.historians.remove(at: indexPath.row)
            self.historiansImages.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }

        alert.addAction(yesAction)

        // cancel action
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedName = chosenName
            destinationVC.selectedImages = chosenImage
            
        }
    }

    }
    
 

