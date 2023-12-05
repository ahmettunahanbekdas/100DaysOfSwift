//
//  UploadViewController.swift
//  Project 21- BasicInstagramClone
//
//  Created by Ahmet Tunahan Bekdaş on 5.12.2023.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
    //MARK: - @IBOutlets
    
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapImage = UITapGestureRecognizer.init(target: self, action: #selector(tapImage))
        imageView.addGestureRecognizer(tapImage)
        imageView.isUserInteractionEnabled = true
        
    }
    
    
    //MARK: - tapImage
    
    @objc func tapImage(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.originalImage] as? UIImage{
            imageView.image = pickerImage
        }
        self.dismiss(animated: true)
    }
    
    
    //MARK: - shareButton
    
    @IBAction func shareButton(_ sender: Any) {
        // Firebase Storage servisine erişim için Storage nesnesi oluşturuluyor.
        let storage = Storage.storage()
        
        // Firebase Storage'da bir referans elde etmek için storage.reference() kullanılıyor.
        let storageReference = storage.reference()
        
        // 'media' adında bir klasör oluşturuluyor. Bu klasör, Firebase Storage'da yüklenen medya dosyalarını saklamak için kullanılacak.
        let mediaFolder = storageReference.child("media")
        
        // 'image.jpg' adında bir dosya referansı oluşturuluyor. Bu, yüklenecek resmin referansını temsil eder.
        let imageReference = mediaFolder.child("image.jpg")
        
        // Eğer bir imageView içinde bir resim varsa, bu resmin JPEG formatında veriye dönüştürülmesi yapılır.
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            // Dönüştürülen resim verisi, oluşturulan imageReference'a yüklenir.
            imageReference.putData(data, metadata: nil) { metaData, error in
                
                // Yükleme sırasında bir hata olup olmadığını kontrol eder.
                if let error = error {
                    // Hata varsa, hatayı konsola yazdırır.
                    print(error.localizedDescription)
                } else {
                    // Yükleme başarılıysa, yüklenen resmin indirme bağlantısını almak için downloadURL fonksiyonu kullanılır.
                    imageReference.downloadURL { url, error in
                        
                        // İndirme bağlantısı alma sırasında bir hata olup olmadığını kontrol eder.
                        if let error = error {
                            // Hata varsa, hatayı konsola yazdırır.
                            print(error.localizedDescription)
                        }
                        
                        // Eğer bir hata yoksa ve indirme bağlantısı başarıyla alındıysa, bağlantıyı alır.
                        if let imageUrl = url?.absoluteString {
                            // Image URL başarılı bir şekilde elde edildi.
                            print("Image URL:", imageUrl)
                        } else {
                            // Eğer indirme bağlantısı alınamazsa, konsola bir hata mesajı yazdırılır.
                            print("Error: Image URL is nil")
                        }
                    }
                }
            }
        }
    }
}
