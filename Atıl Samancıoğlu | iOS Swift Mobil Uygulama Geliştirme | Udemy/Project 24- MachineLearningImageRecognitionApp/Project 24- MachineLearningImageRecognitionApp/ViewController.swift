//
//  ViewController.swift
//  Project 24- MachineLearningImageRecognitionApp
//
//  Created by Ahmet Tunahan Bekdaş on 22.12.2023.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    // MARK: - @IBOutlet and Variables

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var chosenImage = CIImage()
    
    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: - changeButton -> Kullanıcı butona tıkladığında galeriye gitti

    @IBAction func changeButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    // MARK: - changeButton() -> Kullanıcı resmi seçtikten sonra gerçekleşecek işlemler

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            self.dismiss(animated: true)
            
            if let ciImage = CIImage(image: image) {
                chosenImage = ciImage
                recognizeImage(image: chosenImage)
            }
        }
    }
    
    
    // MARK: - recognizeImage() -> Resim Recognizer İşlemi
    
    // 1 Request
    // 2 Handler

    func recognizeImage(image:CIImage){
        
        let MobilerNetConfig = MLModelConfiguration()
        
        if let model = try? VNCoreMLModel(for: MobileNetV2(configuration: MobilerNetConfig).model){
            
            // 1 Request
            let request = VNCoreMLRequest(model: model) { vnRequest, error in
                if let results = vnRequest.results as? [VNClassificationObservation]{
                    if results.count > 0 {
                        let topResult = results.first
                        
                        DispatchQueue.main.async {
                            let cofideanceLevel = (topResult?.confidence ?? 0) * 100
                            self.resultLabel.text = "\(cofideanceLevel)% it's \(topResult?.identifier ?? "Error")"
                        }
                        
                    }
                }else{
                    print(error?.localizedDescription ?? "Error Request")
                }
            }
            
            // 2 Handler
            let handler = VNImageRequestHandler(ciImage: image)
            DispatchQueue.global(qos: .userInteractive).async {
                do{
                    try handler.perform([request])
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}


