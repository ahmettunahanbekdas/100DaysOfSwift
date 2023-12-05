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
        
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        let uuid = UUID().uuidString
        
        
        let mediaFolder = storageReferance.child("media")
        let imageReference = mediaFolder.child("\(uuid).jpg")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            
            imageReference.putData(data, metadata: nil) { metaData, error in
                
                if let error = error {
                    self.makeAlert(title: "Error", message: error.localizedDescription)
                } else {
                    imageReference.downloadURL { url, error in
                        if let error = error {
                            print(error.localizedDescription)
                        }else{
                            if let imageUrl = url?.absoluteString {
                                print("Image URL:", imageUrl)
                            } else {
                                print("Error: Image URL is nil")
                            }
                        }
                    }
                }
            }
        }
    }
}

