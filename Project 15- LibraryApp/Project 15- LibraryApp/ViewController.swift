//
//  ViewController.swift
//  Project 15- LibraryApp
//
//  Created by Ahmet Tunahan Bekdaş on 6.11.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    
    var selectedBook = ""
    var selectedID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 1. TableView için veri kaynağı ve delegeleri ayarlar
        tableView.delegate = self
        tableView.dataSource = self
        
        // 2. Navigasyon çubuğunda "Ekle" düğmesini ekler
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "Created New Object"), object: nil)
    }
    
    
    
    // 3. Veritabanından kitap verilerini almak için kullanılan fonksiyon
    @objc func getData() {
        
        nameArray.removeAll(keepingCapacity: false) // Eski verileri temizle
        idArray.removeAll(keepingCapacity: false)   // Eski verileri temizle
        
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Books")
        fetchRequest.returnsObjectsAsFaults = false // Her zaman kullanmak zorunda değiliz büyük verilerde kullanmak daha verimli olacaktır
        
        do{
            let results = try context.fetch(fetchRequest)
            if  results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") as? String {
                        nameArray.append(name)
                    }
                    if let id = result.value(forKey: "id") as? UUID   {
                        idArray.append(id)
                    }
                    self.tableView.reloadData()
                }
            }
        }catch{
            print("Hata")
        }
    }
    
    
    
    // 4. "Ekle" düğmesine tıklanınca çalışan fonksiyon
    @objc func addButton() {
        selectedBook = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destination = segue.destination as! DetailsViewController
            destination.chosenBook = selectedBook
            destination.chosenID = selectedID
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = nameArray[indexPath.row]
        selectedID = idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Books")
            
            let idString = idArray[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        
                        if let id = result.value(forKey: "id") as? UUID {
                            if id == idArray[indexPath.row] {
                                context.delete(result)
                                nameArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                tableView.reloadData()
                                
                                do{
                                    try context.save()
                                } catch {
                                    print("Error ")
                                }
                                break
                            }
                        }
                    }
                }
            } catch {
                print("Error")
            }
        }
    }
    
}
