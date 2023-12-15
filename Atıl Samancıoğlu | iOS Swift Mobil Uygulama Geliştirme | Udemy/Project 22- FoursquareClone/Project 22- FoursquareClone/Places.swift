//
//  Places.swift
//  Project 22- FoursquareClone
//
//  Created by Ahmet Tunahan Bekdaş on 14.12.2023.
//

import UIKit
import Parse

class Places: UIViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addPlaces))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: UIBarButtonItem.Style.done, target: self, action: #selector(logOut))
    }
    
    
    // MARK: - addPlaces
    
    @objc func addPlaces(){
        performSegue(withIdentifier: "toAddView", sender: nil)
    }
    
    // MARK: - logOut
    
    @objc func logOut(){
        PFUser.logOutInBackground { error in
            if error != nil {
                self.makeAlert(title: "Error", message: error!.localizedDescription)
            }else{
                self.performSegue(withIdentifier: "toLoginPage", sender: nil)
            }
        }
    }
    
    
    
    
}
