//
//  SingletonUser.swift
//  Project 23- SingletonExample
//
//  Created by Ahmet Tunahan Bekdaş on 19.12.2023.
//

import Foundation
import UIKit

// Singleton adında bir sınıf tanımlanıyor.
class Singleton {
    
    // Singleton deseni uygulanmış bir örnek (instance) oluşturuluyor.
    static let sharedInstance = Singleton()
    
    // Kullanıcının adını temsil eden bir String değişkeni.
    var userName: String?
    
    // Kullanıcının soyadını temsil eden bir String değişkeni.
    var userSurname: String?
    
    // Private bir init metodu ile dışarıdan örnek oluşturulmasını engelliyoruz.
    private init(){}
    
}



