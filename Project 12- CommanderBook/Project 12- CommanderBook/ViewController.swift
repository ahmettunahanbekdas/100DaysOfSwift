//
//  ViewController.swift
//  Project 12- CommanderBook
//
//  Created by Ahmet Tunahan Bekdaş on 4.11.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - @IBOutlet and Variables

    @IBOutlet weak var tableView: UITableView!
    
    var commanderArray = [Commander]()
    var chosenCommander : Commander?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Objeler oluşturuldu ve commanderArray'e ekleniyor
        let atatürk = Commander(name: "Mustafa Kemal Atatürk", image: UIImage(named: "atatürk")!, about: "Türkiye Cumhuriyeti Devleti Kurucusu")
        let fatih = Commander(name: "Fatih Sultan Mehmet", image: UIImage(named: "fatih")!, about: "Osmanlı İmparatorluğu Padişahı")
        let cengizhan = Commander(name: "Cengiz Han", image: UIImage(named: "cengizhan")!, about: "Moğol İmparatorluğu Kurucu Komutanı")
        let timur = Commander(name: "Timur", image: UIImage(named: "timur")!, about: "Timur İmparatorluğu Kurucu Hanı")
        let ceaser = Commander(name: "Jül Sezar", image: UIImage(named: "sezar")!, about: "Son Roma İmparatorluğu Dikdatörü")
        let iskender = Commander(name: "Büyük İskender", image: UIImage(named: "iskender")!, about: "Eski Makedonya Kralı")
        
        // Her komutanı commanderArray'e ekleyin
        commanderArray.append(atatürk)
        commanderArray.append(fatih)
        commanderArray.append(cengizhan)
        commanderArray.append(timur)
        commanderArray.append(ceaser)
        commanderArray.append(iskender)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commanderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = commanderArray[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCommander = commanderArray[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presentDeletionFailsafe(indexPath: indexPath)
        }
    }

    func presentDeletionFailsafe(indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: "Are you sure you'd like to delete \(commanderArray[indexPath.row].name)", preferredStyle: .alert)

        // yes action
        let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
            // replace data variable with your own data array
            self.commanderArray.remove(at: indexPath.row)
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
            destinationVC.selectedCommander = chosenCommander
        }
    }
}

