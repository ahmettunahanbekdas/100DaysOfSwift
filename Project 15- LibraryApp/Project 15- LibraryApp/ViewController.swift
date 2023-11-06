//
//  ViewController.swift
//  Project 15- LibraryApp
//
//  Created by Ahmet Tunahan Bekdaş on 6.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))
    }

    @objc func addButton() {
        performSegue(withIdentifier: "ToDetailsVC", sender: nil)
    }
}

