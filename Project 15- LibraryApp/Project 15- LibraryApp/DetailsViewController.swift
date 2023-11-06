//
//  DetailsViewController.swift
//  Project 15- LibraryApp
//
//  Created by Ahmet Tunahan Bekdaş on 6.11.2023.
//

import UIKit

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var writerText: UITextField!
    @IBOutlet weak var pagesText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// MARK: - Recognizer
        // Klavye Kapamak için tıklama olayını oluşturduk
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap) // ekrana ekledik
        
        // Resime tıklama alanı
        imageView.isUserInteractionEnabled = true // resmi tıklanabilir yaptık
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addPhoto)) // tıklandığında çalışıcak fonksiyonu selector içinde belirttik
           imageView.addGestureRecognizer(tapGestureRecognizer) // tıklama olayını resme ekledik
    }
    
    // MARK: - Funtions
    
    // selector ile klavye kapama fonksiyonumuz
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Albümümüze ulaşmak için uyguladığımız fonksiyon
    @objc func addPhoto() {
        let picker = UIImagePickerController() // "UIImagePickerController" sınıfımızı oluşturuyoruz
        picker.delegate = self
        picker.sourceType = .photoLibrary // ulaştığımız yerin tipini seçiyouz kamera albüm gibi
        picker.allowsEditing = true // fotoğrafı editlemek istiyoruz
        present(picker, animated: true) // alertlerde yaptığımız şeyin aynısı pickerı gösteriyoruz
    }
    
    // Kullanıcının fotoğraf seçme işlemi tamamlandığında bu fonksiyon çağrılır.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage // Seçilen fotoğrafı imageview in nesnesi olarak ayarla
        self.dismiss(animated: true, completion: nil) // Fotoğraf seçim ekranını kapat
    }
    
    @IBAction func saveButton(_ sender: Any) {
        print("tapped")
    }
}
