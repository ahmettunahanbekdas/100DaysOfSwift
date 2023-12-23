//
//  ViewController.swift
//  Project 20- APIexample
//
//  Created by Ahmet Tunahan Bekdaş on 2.12.2023.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: - tableView
    // UITableView öğesi için private bir örnek oluşturuluyor.
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - posts[]
    // Post türündeki verileri içeren dizi.
    private var posts: [Post] = []
    
    // MARK: - viewDidLoad
    // ViewController'ın yüklenmesi tamamlandığında çağrılan fonksiyon.
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView öğesini view'e ekleniyor ve constraint'leri ayarlanıyor.
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        // tableView'in dataSource ve delegate'i ViewController olarak ayarlanıyor.
        tableView.dataSource = self
        tableView.delegate = self
        
        // API'den veri çekmek için fonksiyon çağrılıyor.
        fetcDataAPI()
    }
    
    // MARK: - fetcDataAPI
    // JSONPlaceholder API'den veri çeken fonksiyon.
    func fetcDataAPI() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Fetch JSON Error")
            return
        }
        
        // URLSession ile API çağrısı yapılıyor.
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("API request \(error)")
            }
            
            guard let data = data else {
                print("Invalid data received")
                return
            }
            
            do {
                // JSON verisi Post türündeki nesnelere dönüştürülüyor.
                let decodeData = try JSONDecoder().decode([Post].self, from: data)
                self.posts = decodeData
                
                // Ana thread üzerinde tableView yeniden yükleniyor.
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("\(error)")
            }
        }.resume()
    }
}

    // MARK: - ViewController: UITableViewDataSource, UITableViewDelegate
    // UITableView için gerekli dataSource ve delegate fonksiyonlarını uygulayan extension.
    extension ViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Tabloda gösterilecek hücre sayısı, 'posts' dizisinin eleman sayısı kadar.
            return posts.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Her bir hücre için veriler atanıyor.
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            let post = posts[indexPath.row]
            cell.textLabel?.text = post.title
            cell.detailTextLabel?.text = post.body
            return cell
        }
    }



