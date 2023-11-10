//
//  DetailsViewController.swift
//  Project 16- FoodsBook
//
//  Created by Ahmet Tunahan Bekdaş on 10.11.2023.
//

import UIKit

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - @IBOutlet And Variables

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var calories: UITextField!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Klavye kapatma için oluşturulan Recognizer
        let tapView = UITapGestureRecognizer.init(target: self, action: #selector(tapView))
            view.addGestureRecognizer(tapView)
        
        // Image tıklama için oluşturulan Recognizer
        let tapImage = UITapGestureRecognizer.init(target: self, action: #selector(tapImage))
        
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapImage)
        
    }
    
    // MARK: - Funcitons()
    
    // Klavye kapama fonksiyonu
    @objc func tapView() {
        view.endEditing(true)
    }
    
    // Resime tıklanınca çalışan fonksiyon
    @objc func tapImage() {
        // UIImagePickerController örneği oluşturulur
        let imagePicker = UIImagePickerController()
        // Delegenin bu sınıfın kendisi olmasını belirtir
        imagePicker.delegate = self
        // Fotoğraf albümünü kullanma amacı belirtilir
        imagePicker.sourceType = .photoLibrary
        // Kullanıcıya düzenleme seçeneği sunulur
        imagePicker.allowsEditing = true
        // UIImagePickerController'ı ekranda gösterir
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Seçilen resmin UIImage tipinde olup olmadığı kontrol edilir
        if let pickerImage = info[.originalImage] as? UIImage {
            // Eğer seçilen resim UIImage ise, imageView'da gösterilmesi sağlanır
            image.image = pickerImage
        }
        // UIImagePickerController ekranı kapatılır
        self.dismiss(animated: true)
    }
    
    
}
