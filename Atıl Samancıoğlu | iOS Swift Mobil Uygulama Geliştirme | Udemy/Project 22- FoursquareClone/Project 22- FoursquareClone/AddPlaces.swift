//
//  AddPlaces.swift
//  Project 22- FoursquareClone
//
//  Created by Ahmet Tunahan Bekdaş on 14.12.2023.
//

import UIKit
import Parse




class AddPlaces: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var placeNameTextField: UITextField!
    @IBOutlet weak var placeTypeTextField: UITextField!
    @IBOutlet weak var placeCommentTextField: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeImageView.isUserInteractionEnabled = true
        let tappedImage = UITapGestureRecognizer.init(target: self, action: #selector(chooseImage))
        placeImageView.addGestureRecognizer(tappedImage)
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(toMap))
        
        
    }
    
    // MARK: - nextButton
    
    @objc func toMap() {
        
        if placeNameTextField.text != "" && placeCommentTextField.text != "" && placeTypeTextField.text != ""{
            
            if let chosenImage = placeImageView.image {
                let placesModel = PlacesModel.sharedInstance
                placesModel.placesName = placeNameTextField.text
                placesModel.placesType = placeCommentTextField.text
                placesModel.placesComment = placeCommentTextField.text
                placesModel.placesImage = chosenImage
                
                performSegue(withIdentifier: "toMap", sender: nil)
            } 
            
        }else {
            makeAlert(title: "Error", message: "Please Enter Text Fields and Choose Image")
        }
        
        
        
    }
    
    // MARK: - tappedImage
    
    @objc func chooseImage() {
        print("tappedImage")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.editedImage] as? UIImage{
            placeImageView.image = pickerImage
        }
        self.dismiss(animated: true)
    }
}
