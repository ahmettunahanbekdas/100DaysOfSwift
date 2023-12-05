//
//  UploadViewController.swift
//  Project 21- BasicInstagramClone
//
//  Created by Ahmet Tunahan Bekdaş on 5.12.2023.
//

import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapImage = UITapGestureRecognizer.init(target: self, action: #selector(tapImage))
        imageView.addGestureRecognizer(tapImage)
        imageView.isUserInteractionEnabled = true
    
        
    }
    

    @IBAction func shareButton(_ sender: Any) {
        
    }
    
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

}
