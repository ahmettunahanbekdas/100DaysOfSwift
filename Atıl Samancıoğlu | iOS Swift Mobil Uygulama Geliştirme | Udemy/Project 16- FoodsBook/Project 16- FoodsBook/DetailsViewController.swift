//
//  DetailsViewController.swift
//  Project 16- FoodsBook
//
//  Created by Ahmet Tunahan Bekdaş on 10.11.2023.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - @IBOutlet And Variables
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var calories: UITextField!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var savebutton: UIButton!
    
    var chosenFood = ""
    var chosenID : UUID?
    
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      if chosenFood != "" {
          
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Foods")
            fetchRequest.returnsObjectsAsFaults = false
            
            let idString = chosenID?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            
            do{
                let results = try managedContext.fetch(fetchRequest)
                for item in results as! [NSManagedObject] {
                    if let name = item.value(forKey: "name") as? String {
                        self.name.text = name
                    }
                    if let type = item.value(forKey: "type") as? String {
                        self.type.text = type
                    }
                    if let calories = item.value(forKey: "calories") as? Int {
                        self.calories.text = "\(calories) Calories"
                    }
                    if let imageData = item.value(forKey: "image") as? Data {
                        if let image = UIImage(data: imageData) {
                            self.image.image = image
                        }
                    }
                    
                }
                
            }catch{
                print("Error")
            }
        }else {
            savebutton.isHidden = true
            savebutton.isEnabled = false
        }
        
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
        
        savebutton.isHidden = false
        savebutton.isEnabled = true
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
    
 
    //MARK: - SAVE BUTTON
    
    // Save Button Tıklandığında fonksiyonlar
    @IBAction func saveButton(_ sender: Any) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate   // AppDelegate'e erişim sağlanır, Core Data Stack'e ulaşılır
        else {
            return print("Don't use CoreData")
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext// CoreData'dan yönetilen bir bağlam elde edilir
        if let entity = NSEntityDescription.entity(forEntityName: "Foods", in: managedContext) {// Eğer 'Foods' adında bir varlık (entity) varsa, onunla ilgili bir bağlam oluşturulur
      
            let foodItem = NSManagedObject(entity: entity, insertInto: managedContext) as! Foods     // Yeni bir 'FoodItem' varlığı oluşturulur
            
            foodItem.setValue(name.text, forKey: "name") // Kullanıcının girdiği ismi, "name" özelliğine atar.
            
            foodItem.setValue(type.text, forKey: "type") // Kullanıcının girdiği tür bilgisini, "type" özelliğine atar.
            
            if let calories = Int(calories.text!) {
                foodItem.setValue(calories, forKey: "calories") // Kullanıcının girdiği kalori miktarını "calories" özelliğine atar.
            } else {
                print("Calories Kısmına yanlış bir giriş yapıldı") // Eğer giriş bir sayıya dönüşemezse, hata mesajı yazdırır.
            }
            
            foodItem.setValue(UUID(), forKey: "id") // Yeni bir UUID oluşturup, "id" özelliğine atar.
            
            let data = image.image?.jpegData(compressionQuality: 0.5) // Resmi JPEG veri türüne dönüştürür.
            foodItem.setValue(data, forKey: "image") // Resmi "image" özelliğine atar.
            
            do {
                try managedContext.save() // Yapılan değişiklikleri kaydeder.
                print("Save Success") // Başarılı bir şekilde kaydedildiğine dair mesaj yazdırır.
            } catch {
                print("Save Error") // Kaydetme sırasında bir hata olursa hata mesajı yazdırır.
            }
            
            
            
            self.navigationController?.popViewController(animated: true)

            
        }
        
    }
    
    
}
