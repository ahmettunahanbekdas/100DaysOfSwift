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
        guard let selectedImage = imageView.image else {
            makeAlert(title: "Error", message: "Please Choose Image")
            return
        }
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let uuid = UUID().uuidString
        
        let mediaFolder = storageReference.child("media")
        let imageReference = mediaFolder.child("\(uuid).jpg")
        
        if let imageData = selectedImage.jpegData(compressionQuality: 0.5) {
            imageReference.putData(imageData, metadata: nil) { _, error in
                if let error = error {
                    self.makeAlert(title: "Error", message: error.localizedDescription)
                    return
                }
                
                imageReference.downloadURL { url, error in
                    if let error = error {
                        self.makeAlert(title: "Error", message: error.localizedDescription)
                    }
                    
                    guard let imageUrl = url?.absoluteString else {
                        self.makeAlert(title: "Error", message: "Image URL is nil")
                        return
                    }
                    
                                   
                    if self.commentTextField.text == "" {
                        self.makeAlert(title: "Error", message: "Please Enter Comment")
                        return
                    }
                    
                    // Firestore Database
                    
                    let firestoreDatabase = Firestore.firestore()
                    var firestoreReferance : DocumentReference?
                    
                    let firestorePost = [
                        "imageUrl": imageUrl,
                        "postBy": Auth.auth().currentUser?.email ?? "",
                        "postComment": self.commentTextField.text ?? "",
                        "date": FieldValue.serverTimestamp(),
                        "like": 0
                    ]
                    
                    firestoreReferance = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { error in
                        if error != nil {
                            self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                        }
                    })
                    self.makeAlert(title: "Succes", message: "")
                    self.imageView.image = UIImage(named: "addPhoto")
                    self.commentTextField.text = ""
                    self.tabBarController?.selectedIndex = 0
                }
            }
        }
    }
}


