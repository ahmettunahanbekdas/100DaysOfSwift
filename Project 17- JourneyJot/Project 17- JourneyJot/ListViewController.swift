//  ListViewController.swift
//  Project 17- JourneyJot
//
//  Created by Ahmet Tunahan Bekdaş on 28.11.2023.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var nameArray = [String]()  // Veritabanından alınan "name" özelliklerini saklamak için dizi
    var idArray = [UUID]()      // Veritabanından alınan "id" özelliklerini saklamak için dizi
    var chosenName = ""
    var chosenId : UUID?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sağ üst köşede "+" butonu eklenir ve "addButton" fonksiyonu bu butona bağlanır
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        
        // UITableView'nin delegate ve dataSource'ı bu sınıfa atanır
        tableView.delegate = self
        tableView.dataSource = self
        
        // CoreData'den verileri çekmek için "getData" fonksiyonu çağrılır
        getData()
    }
    
    // MARK: - Functions
    
    // "+" butonuna basıldığında çağrılan fonksiyon
    @objc func addButton() {
        // Ekleme işleminde name boş olucak
        chosenName = ""
        // "toViewController" segue'si çağrılır
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
    // UITableView'nin satır sayısını belirten fonksiyon
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    // UITableView'nin hücre içeriğini belirten fonksiyon
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // Hücrenin metin içeriği, nameArray dizisinden alınır
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    // CoreData'den verileri çeker ve ilgili dizilere atar
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                self.nameArray.removeAll(keepingCapacity: false)
                self.idArray.removeAll(keepingCapacity: false)
                
                // CoreData'den alınan veriler dizilere atanır
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") as? String {
                        nameArray.append(name)
                    }
                    if let id = result.value(forKey: "id") as? UUID {
                        idArray.append(id)
                    }
                    self.tableView.reloadData()
                }
            }
        } catch {
            print("Error fetching data")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenName = nameArray[indexPath.row]
        chosenId = idArray[indexPath.row]
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewController"{
            let destinationVC = segue.destination as! ViewController
            destinationVC.selectedName = chosenName
            destinationVC.selectedId = chosenId
        }
    }
}
