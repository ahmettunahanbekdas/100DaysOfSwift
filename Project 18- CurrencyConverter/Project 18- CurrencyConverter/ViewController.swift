//
//  ViewController.swift
//  Project 18- CurrencyConverter
//
//  Created by Ahmet Tunahan Bekdaş on 29.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Request & Session = Veriyi alacağımız bağlantıya gitme işlemi
    // Response & Data = Burada ki Response veya Datayı alma işlemi
    // Parsing & JSON Serialization = Datayı işleme işlemi
    
    @IBAction func getRatesButton(_ sender: Any) {
        
        // 1 & Session
        
        // API'den veri almak için HTTP isteği yapma işlemi
        //  URL'yi tanımlama
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        
        //  URLSession: Tüm ağ isteklerinin yapıldığı ana nokta
        
        
        //  URLSessionDataTask: Asenkron veri alma işlemi
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            // Hata kontrolü
            if error != nil {
                // Hata varsa kullanıcıya bildirme
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true)
                
            } else {
                // Hata yoksa, veri var mı kontrolü
                if let data = data {
                    do {
                        
                        // 2 Response & Data
                        
                        // JSON veriyi çözümleme
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary <String, Any>
                        
                        // Ana iş parçasında (main thread) görsel güncelleme
                        DispatchQueue.main.async {
                            // Alınan JSON veriyi yazdırma
                            if let rates = jsonResponse["rates"] as? [String : Any]{
                                
                                if let cad = rates["CAD"] as? Double{
                                    self.cadLabel.text = "CAD : \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.chfLabel.text = "CHF : \(chf)"
                                }
                                if let jpy = rates["JPY"] as? Double{
                                    self.jpyLabel.text = "JPY : \(jpy)"
                                }
                                if let gbp = rates["GBP"] as? Double{
                                    self.gbpLabel.text = "GBP : \(gbp)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.usdLabel.text = "USD : \(usd)"
                                }
                                if let trye = rates["TRY"] as? Double{
                                    self.tryLabel.text = "TRY : \(trye)"
                                }
                            }
                        }
                        
                    } catch {
                        print("Data Error")
                    }
                }
            }
        }
        
        // İşlemi başlatma
        task.resume()
    }
}
