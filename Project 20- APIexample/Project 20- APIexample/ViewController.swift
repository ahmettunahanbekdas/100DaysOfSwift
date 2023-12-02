//
//  ViewController.swift
//  Project 20- APIexample
//
//  Created by Ahmet Tunahan Bekdaş on 2.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    

    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var posts: [Post] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func fetcDataAPI() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else {
            print("Fetch JSON Error")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("API request \(error)")
            }
            
            guard let data = data else {
                print("Invalid data received")
                return
            }
            
            
            do{
                let decodeData = try JSONDecoder().decode([Post], from: data)
            }catch{
                
            }
            
        }
        
        
        
        
        
    }
    
    
    
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        let post = "Test"
        
        // Hücreyi doldur
        cell.textLabel?.text = post
        
        return cell
    }
}

