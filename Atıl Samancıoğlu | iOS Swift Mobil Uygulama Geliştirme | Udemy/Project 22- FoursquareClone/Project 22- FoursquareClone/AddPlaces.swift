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
        
        let tappedImage = UITapGestureRecognizer.init(target: self, action: #selector(tappedImage))
        placeImageView.addGestureRecognizer(tappedImage)
        placeImageView.isUserInteractionEnabled = true

    }
    
    // MARK: - nextButton

    @IBAction func nextButton(_ sender: Any) {
        /*
        let parseObject = PFObject(className: "Places")
        parseObject["placesName"] = placeNameTextField.text
        parseObject["placesType"] = placeTypeTextField.text
        parseObject["placesComment"] = placeCommentTextField.text
        
        parseObject.saveInBackground { succes, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            }else{
                self.makeAlert(title: "Succes", message: "Added Places")
            }
        }
         */
        
        performSegue(withIdentifier: "toMap", sender: nil)
        
    }
    
    // MARK: - tappedImage

    @objc func tappedImage() {
        print("tappedImage")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.originalImage] as? UIImage{
            placeImageView.image = pickerImage
        }
        self.dismiss(animated: true)
    }
}
