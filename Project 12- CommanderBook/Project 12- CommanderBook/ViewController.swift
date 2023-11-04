//
//  ViewController.swift
//  Project 12- CommanderBook
//
//  Created by Ahmet Tunahan Bekdaş on 4.11.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedCommander = chosenCommander
        }
    }
}

