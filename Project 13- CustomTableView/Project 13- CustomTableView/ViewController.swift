//
//  ViewController.swift
//  Project 13- CustomTableView
//
//  Created by Ahmet Tunahan Bekdaş on 5.11.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var mansArray = [Mans]()
    var chosenMans : Mans?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let elon = Mans(name: "Elon Musk", image: UIImage(named: "elon")!, about: "SpaceX")
        let steve = Mans(name: "Steve Jobs", image: UIImage(named: "steve")!, about: "Apple")
        let mark = Mans(name: "Mark Zuckerberk", image: UIImage(named: "mark")!, about: "Meta")
        let bill = Mans(name: "Bill Gates", image: UIImage(named: "bill")!, about: "Microsoft")
        
        mansArray.append(elon)
        mansArray.append(steve)
        mansArray.append(mark)
        mansArray.append(bill)
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mansArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mans = mansArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CutomTableViewCell
        cell.label.text = mans.name
        cell.images.image = mans.image
        cell.images.layer.cornerRadius = 50
        cell.images.layer.borderColor = .init(gray: 100, alpha: 1)
        cell.images.layer.borderWidth = 1.5
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenMans = mansArray[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               presentDeletionFailsafe(indexPath: indexPath)
           }
       }

       func presentDeletionFailsafe(indexPath: IndexPath) {
           let alert = UIAlertController(title: nil, message: "Are you sure you'd like to delete \(mansArray[indexPath.row].name)", preferredStyle: .alert)

           // yes action
           let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
               // replace data variable with your own data array
               self.mansArray.remove(at: indexPath.row)
               self.tableView.deleteRows(at: [indexPath], with: .fade)
           }

           alert.addAction(yesAction)

           // cancel action
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

           present(alert, animated: true, completion: nil)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailViewController
             destinationVC.selectedMan = chosenMans
        }
    }
    
    
}
