//
//  ViewController.swift
//  Project 16- FoodsBook
//
//  Created by Ahmet Tunahan Bekdaş on 10.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - @IBOutlet And Variables
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add butonu eklendi ve selector ile istenen fonksiyon çalıştırıldı.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
    }
    
    
    // MARK: - Funcitons()
    
    // Add butonuna tıklandığımda yapılan işlemin fonksiyonu.
    @objc func addButton() {
        performSegue(withIdentifier: "toDetailViewController", sender: nil)
    }
   


}

