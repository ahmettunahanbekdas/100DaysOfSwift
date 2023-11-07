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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. TableView için veri kaynağı ve delegeleri ayarlar
        tableView.delegate = self
        tableView.dataSource = self
        
        // 2. Navigasyon çubuğunda "Ekle" düğmesini ekler
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
    }
    
    // 3. Veritabanından kitap verilerini almak için kullanılan fonksiyon
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Books")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                print(result)
            }
        }catch{
            print("Hata")
        }
    }
    
    // 4. "Ekle" düğmesine tıklanınca çalışan fonksiyon
    @objc func addButton() {
        performSegue(withIdentifier: "ToDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // TableView'da toplam 10 satır olacak
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() // Her hücreyi oluşturur
        cell.textLabel?.text = "Test" // Her hücrenin metni "Test" olarak ayarlar
        return cell
    }
}
