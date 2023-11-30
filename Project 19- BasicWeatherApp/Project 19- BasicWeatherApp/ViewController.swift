//
//  ViewController.swift
//  Project 19- BasicWeatherApp
//
//  Created by Ahmet Tunahan Bekdaş on 30.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    @IBOutlet weak var windyLabel: UILabel!
    var api = "8fd636941fefae14223ab9d35b83ac5c"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather API"
    }
    
    // Request & Session = Veriyi alacağımız bağlantıya gitme işlemi
    // Response & Data = Burada ki Response veya Datayı alma işlemi
    // Parsing & JSON Serialization = Datayı işleme işlemi
    
    @IBAction func getButton(_ sender: Any) {
        
        // 1.Request & Session
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=41.11315928467933&lon=29.021466229358197&appid=\(api)")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }else{
                // 2.Response & Data
                if  let data = data {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                        
                        DispatchQueue.main.async {
                            if let main = jsonResponse!["main"] as? [String:Any]{
                                if let temp = main["temp"] as? Double{
                                    self.tempLabel.text = String(temp)
                                    print(temp)
                                }
                                if let feelsTemp = main["feels_like"] as? Double{
                                    self.feelLabel.text = String(feelsTemp)
                                }
                            }
                            if let wind = jsonResponse!["wind"] as? [String:Any]{
                                if let windy = wind["speed"] as? Double{
                                    self.windyLabel.text = String(windy)
                                }
                            }
                        }
                    }catch{
                        print("Error Response")
                    }
                    
                }
            }
        }
        task.resume()
    }
    
}




