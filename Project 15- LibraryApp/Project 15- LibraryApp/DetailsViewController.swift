import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // Bu sınıf, kitap detaylarını ve bir kitap eklemek için kullanılan resim seçme işlevlerini içerir.
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var writerText: UITextField!
    @IBOutlet weak var pagesText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Recognizer
        // Klavye kapatma alanı için bir jest tanımlar
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Resme tıklama alanı için bir jest tanımlar
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addPhoto))
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - Functions
    
    // Klavyeyi kapatmak için kullanılan fonksiyon
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Albümümüze ulaşmak için kullanılan fonksiyon
    @objc func addPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    // Kullanıcının fotoğraf seçme işlemi tamamlandığında bu fonksiyon çağrılır.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Save Button Save CoreData 

    @IBAction func saveButton(_ sender: Any) {
        // 1. AppDelegate'e erişim sağlar
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2. CoreData için bir veri bağlamı (context) oluşturur
        let context = appDelegate.persistentContainer.viewContext
        
        // 3. Yeni bir "Books" (Kitaplar) varlığı oluşturur ve bağlama ekler
        let newBook = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        // 4. Kitabın adını ve yazarını girilen metin alanlarından alır ve varlığa ekler
        newBook.setValue(nameText.text, forKey: "name")
        newBook.setValue(writerText.text, forKey: "writer")
        
        // 5. Sayfa sayısını metinden bir tamsayıya dönüştürür ve varlığa ekler
        if let pages = Int(pagesText.text!) {
            newBook.setValue(pages, forKey: "pages")
        } else {
            print("Pages Kısmına yanlış bir giriş yapıldı")
        }
        
        // 6. Varlığa benzersiz bir kimlik (UUID) ekler
        newBook.setValue(UUID(), forKey: "id")
        
        // 7. Görseli JPEG veri biçimine dönüştürür ve varlığa ekler
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        newBook.setValue(data, forKey: "image")
        
        // 8. Değişiklikleri kaydeder
        do {
            try context.save()
            print("Başarılı")
            print(newBook)
            print(data!)
        } catch {
            print("Hata")
        }
    }
}
