//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Ahmet Tunahan Bekdaş on 2.11.2023.
//

import UIKit

// ViewController adında bir sınıf tanımlanıyor.
// UIViewController, UITableViewDelegate ve UITableViewDataSource protokollerini uyguluyor.
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Storyboard'da bağlanmış bir UITableView öğesini temsil eden bir outlet.
    @IBOutlet weak var tableView: UITableView!
    
    // Uygulama başladığında çalışan fonksiyon.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tablo görünümünün delegesini ve veri kaynağını bu sınıfa ayarlar.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Tablo görünümünde kaç satır gösterileceğini belirleyen fonksiyon.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30 // Şu an için her zaman 30 satır döndürülüyor.
    }
    
    // Her hücrenin içeriğini ve görünümünü yapılandıran fonksiyon.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() // Bir UITableViewCell örneği oluşturuluyor.

        // Hücrenin metin içeriğini özelleştiriyoruz.
        var content = cell.defaultContentConfiguration()
 //     cell.textLabel?.text = "Text V1"
        content.text = "Main Text" // Ana metin
        content.secondaryText = "Secondary Text" // İkincil metin
        cell.contentConfiguration = content
        
        return cell // Hücre döndürülüyor.
    }
}

