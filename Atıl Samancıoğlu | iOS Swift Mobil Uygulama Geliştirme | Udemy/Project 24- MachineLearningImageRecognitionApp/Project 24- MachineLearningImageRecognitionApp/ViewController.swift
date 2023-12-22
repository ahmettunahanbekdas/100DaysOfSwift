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
        var image = imageView.image
        image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
        
        
        if let ciImage = CIImage(image: image!) {  // Kullanıcının seçtiği resmi CIImage tipine çevirmeyi dene
            chosenImage = ciImage // Değiştirme tip dönüşümü gerçekleşirse chosenImage içersine koy
        }
        recognizeImage(image: chosenImage) // recognizeImage fonksiyonunu çağır
    }
    
    
    // MARK: - recognizeImage() -> Resim Recognizer İşlemi
    
    // 1 Reques
    // 2 Handler

    func recognizeImage(image:CIImage){
        let MobilerNetConfig = MLModelConfiguration()
        if let model = try? VNCoreMLModel(for: MobileNetV2(configuration: MobilerNetConfig).model){
            let request = VNCoreMLRequest(model: model) { vnRequest, error in
                if let results = vnRequest.results as? [VNClassificationObservation]{
                    if results.count > 0 {
                        let topResult = results.first
                        
                        DispatchQueue.main.async {
                            let cofideanceLevel = (topResult?.confidence ?? 0) * 100
                            self.resultLabel.text = "\(cofideanceLevel)% it's \(topResult?.identifier ?? "Error")"
                        }
                    }
                }
            }
        }
    }
}


