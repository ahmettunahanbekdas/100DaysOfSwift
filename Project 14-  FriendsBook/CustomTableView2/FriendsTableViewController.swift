//
//  ViewController.swift
//  CustomTableView2
//
//  Created by Ahmet Tunahan Bekdaş on 5.11.2023.
//

import UIKit

class FriendsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var friendsTableView: UITableView!
    var friendsList = [Friends]()
    var chosenFriends: Friends?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendsTableView.dataSource = self
        friendsTableView.delegate = self
        initList()
        
    }
    
    func initList() {
        let tolga = Friends(name: "Tolga Saruhan", city: "İzmir", jobs: "Bilgisayar Mühendisi", age: 22, image: UIImage(named: "tolga")!)
        
        let arif = Friends(name: "Arif Fıçı", city: "Eskişehir", jobs: "Endüstiri Mühendisi", age: 23, image: UIImage(named: "arif")!)
        
        let ahmet = Friends(name: "Ahmet Altunel", city: "İstanbul", jobs: "Elektrik Mühendisi", age: 23, image: UIImage(named: "ahmet")!)
        
        let berat = Friends(name: "Berat Altunbay", city: "Zonguldak", jobs: "Gemi Mühendisi", age: 21, image: UIImage(named: "berat")!)
        
        let gökay = Friends(name: "Gökay İnci", city: "Eskişehir", jobs: "Endüstiri Mühendisi", age: 23, image: UIImage(named: "gökay")!)
        
        let hüseyin = Friends(name: "Hüseyin Akın", city: "Eskişehir", jobs: "Makina Mühendisi", age: 23, image: UIImage(named: "hüseyin")!)
        
        let ömer = Friends(name: "Ömer Atun", city: "Tekirdağ", jobs: "Esnaf", age: 23, image: UIImage(named: "ömer")!)
        
        let önder = Friends(name: "Önder Atun", city: "Ankara", jobs: "Profosyonel Basketbolcu", age: 23, image: UIImage(named: "önder")!)
        
        let serhat = Friends(name: "Serhat Güler", city: "Ankara", jobs: "Subay", age: 23, image: UIImage(named: "serhat")!)
        
        let utku = Friends(name: "Utku Müezzinoğlu", city: "İstanbul", jobs: "Avukat", age: 23, image: UIImage(named: "utku")!)
        
        friendsList.append(tolga)
        friendsList.append(arif)
        friendsList.append(ahmet)
        friendsList.append(berat)
        friendsList.append(gökay)
        friendsList.append(hüseyin)
        friendsList.append(ömer)
        friendsList.append(önder)
        friendsList.append(serhat)
        friendsList.append(utku)

        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friends = friendsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! CustomViewControllerCell
        cell.friendsName.text = friends.name
        cell.friendsImage.image = friends.image
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenFriends = friendsList[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "toDetailVC" {
               let destinationVC = segue.destination as! DetailsViewController
               destinationVC.selectFriends = chosenFriends               
           }
       }
    
}

