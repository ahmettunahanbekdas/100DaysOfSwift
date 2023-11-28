//
//  ListViewController.swift
//  Project 17- JourneyJot
//
//  Created by Ahmet Tunahan Bekdaş on 28.11.2023.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var nameArray = [String]()  // CoreData'den alınan "name" özelliklerini saklamak için dizi
    var idArray = [UUID]()      // CoreData'den alınan "id" özelliklerini saklamak için dizi
    var chosenName = ""
    var chosenId: UUID?
    
    // MARK: - View Lifecycle
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Yeni bir mekan eklenirse, bu ekrana geri dönüldüğünde verileri güncellemek için notifikasyon dinleyicisi eklenir
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newPlace"), object: nil)
    }
    
    // MARK: - Functions
    
    // "+" butonuna basıldığında çağrılan fonksiyon
    @objc func addButton() {
        // Ekleme işleminde name boş olacak
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
    @objc func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                // Eski verileri temizle
                nameArray.removeAll()
                idArray.removeAll()

                // CoreData'den alınan veriler dizilere atanır
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") as? String,
                       let id = result.value(forKey: "id") as? UUID {
                        nameArray.append(name)
                        idArray.append(id)
                    }
                }
                // TableView'ı güncelle
                tableView.reloadData()
            }
        } catch {
            print("Error fetching data")
        }
    }

    // UITableView'deki bir hücreye tıklandığında çağrılan fonksiyon
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Kullanıcı bir UITableViewCell'a tıkladığında bu fonksiyon tetiklenir.
        // indexPath.row ile tıklanan hücrenin indeksinden nameArray ve idArray dizilerinde ilgili veriler alınır.
        chosenName = nameArray[indexPath.row]
        chosenId = idArray[indexPath.row]
        // "toViewController" segue'sini tetikleyerek başka bir görünüme geçiş yapılır.
        performSegue(withIdentifier: "toViewController", sender: nil)
    }

    // Segue sırasında veri aktarımı için hazırlık fonksiyonu
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Segue "toViewController" ise, hedef görünüm kontrolcüsünü alırız.
        if segue.identifier == "toViewController" {
            let destinationVC = segue.destination as! ViewController
            // chosenName ve chosenId değişkenlerini kullanarak, hedef görünüm kontrolcüsünün ilgili özelliklerini ayarlarız.
            destinationVC.selectedName = chosenName
            destinationVC.selectedId = chosenId
        }
    }
}

