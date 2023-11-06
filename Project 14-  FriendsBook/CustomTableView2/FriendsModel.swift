//
//  FriendsModel.swift
//  CustomTableView2
//
//  Created by Ahmet Tunahan Bekdaş on 5.11.2023.
//

import UIKit


class Friends {
    var name: String
    var city: String
    var jobs: String
    var age: Int
    var image: UIImage
    
    
    init(name: String, city: String, jobs: String, age: Int, image: UIImage) {
        self.name = name
        self.city = city
        self.jobs = jobs
        self.age = age
        self.image = image
    }
}


// 1- Dosyalarımızı oluşturduk
// "FriendsViewController" ımızı oluşturduk rowlarımızı burada listleyeceğiz
// Costum Rowlarımız için bir "CustomViewControllerCell"
// Friends Modelimizi Class ile oluşturduk "FriendsModel"


// 2- Storyboard üzerinde tasarımımızı yapacağız
// detailvc oluşturduk ve sınıfımızı tanımladık ve segue adımızı verdik
// custom row umuzun elemanlarını "CustomViewControllerCell" dosyamıza tanımladık



