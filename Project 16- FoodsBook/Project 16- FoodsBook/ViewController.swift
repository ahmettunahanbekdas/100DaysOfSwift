//
//  ViewController.swift
//  Project 16- FoodsBook
//
//  Created by Ahmet Tunahan Bekdaş on 10.11.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    // MARK: - @IBOutlet And Variables
    
    @IBOutlet weak var tableView: UITableView!
    // CoreDatadan gelen verileri bir array içersine attım
    var foods:[NSManagedObject] = []
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Add butonu eklendi ve selector ile istenen fonksiyon çalıştırıldı.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCoreData()
    }

    
    
    // MARK: - Funcitons()
    
    
    
    // Add butonuna tıklandığımda yapılan işlemin fonksiyonu.
    @objc func addButton() {
        performSegue(withIdentifier: "toDetailViewController", sender: nil)
    } 
        func fetchCoreData() {
            // AppDelegate üzerinden CoreDataya erişildi
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //Foods entitysinden veri çekme talebi oluşturuldu
            let fetchReques = NSFetchRequest<NSManagedObject>(entityName: "Foods")
            
            do {
                foods =  try managedContext.fetch(fetchReques)
                tableView.reloadData()
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    
    
    // TableView de listeleme işlemi
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TableView'da her bir hücreyi temsil eden UITableViewCell türünde bir örnek oluşturuyoruz
        let cell = UITableViewCell()
        // Örnek oluşturulurken kullanılacak hücre tanımlaması ve özellik atamaları burada yapılabilir
        let food = foods[indexPath.row]
        cell.textLabel?.text = food.value(forKeyPath: "name") as? String
        return cell
    }
    
    
}

