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
    var foods :[NSManagedObject] = []
    
    var foodsArray = [String]()
    var foodsID = [UUID]()
    
    var selectedFood = ""
    var selectedID : UUID!
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Add butonu eklendi ve selector ile istenen fonksiyon çalıştırıldı.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
    }
    
    // MARK: - viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        fetchCoreData()
    }
    
    
    
    // MARK: - Funcitons()
    
    
    
    // Add butonuna tıklandığımda yapılan işlemin fonksiyonu.
    @objc func addButton() {
        performSegue(withIdentifier: "toDetailViewController", sender: nil)
    }
    
    
    func fetchCoreData() {
        
        foodsID.removeAll(keepingCapacity: false) // Eski verileri temizle
        foodsArray.removeAll(keepingCapacity: false)
        
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
        if let calories = food.value(forKeyPath: "calories") as? Int16 {
            cell.textLabel?.text = "Calories: \(calories)"
        } else {
            cell.textLabel?.text = "Calories: N/A" // Eğer değer dönüşmezse bir varsayılan metin gösterilebilir
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let foodName = foods[indexPath.row].value(forKey: "name") as? String {
            selectedFood = foodName
        }
        if let foodID = foods[indexPath.row].value(forKey: "id") as? UUID {
            selectedID = foodID
        }
        performSegue(withIdentifier: "toDetailViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewController" {
            let destination = segue.destination as? DetailsViewController
            destination?.chosenFood = selectedFood
            destination?.chosenID = selectedID
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let foodToDelete = foods[indexPath.row] // Silinecek yiyecek
            
            do {
                managedContext.delete(foodToDelete) // Core Data'dan kaldır
                try managedContext.save() // Değişiklikleri kaydet
                
                foods.remove(at: indexPath.row) // Diziden kaldır
                tableView.deleteRows(at: [indexPath], with: .fade) // TableView'dan hücreyi kaldır
                
            } catch {
                print("Error deleting food: \(error)")
            }
        }
    }
    
    
}
    
    

