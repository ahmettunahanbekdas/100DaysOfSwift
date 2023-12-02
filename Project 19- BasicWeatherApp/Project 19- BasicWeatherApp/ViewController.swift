import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    @IBOutlet weak var windyLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var locationManager = CLLocationManager()
    var api = "8fd636941fefae14223ab9d35b83ac5c"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Basic Weather App"
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
    }
    
    @IBAction func getButton(_ sender: Any) {
        // 1.Request & Session
        if let location = locationManager.location {
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(api)")
            
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: url!) { data, response, error in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default)
                    alert.addAction(okButton)
                    self.present(alert, animated: true)
                } else {
                    // 2.Response & Data
                    if let data = data {
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                            
                            DispatchQueue.main.async {
                                if let main = jsonResponse?["main"] as? [String:Any] {
                                    if let temp = main["temp"] as? Double {
                                        let tempCelsius = temp - 273.15
                                        self.tempLabel.text = String(format: "%.2f", tempCelsius)
                                    }
                                    if let feelsTemp = main["feels_like"] as? Double {
                                        let feelsTempCelsius = feelsTemp - 273.15
                                        self.feelLabel.text = String(format: "%.2f", feelsTempCelsius)
                                    }
                                }
                                if let wind = jsonResponse?["wind"] as? [String:Any] {
                                    if let windy = wind["speed"] as? Double {
                                        self.windyLabel.text = String(windy)
                                    }
                                }
                                
                                if let sys = jsonResponse?["sys"] as? [String:Any] {
                                    if let country = sys["country"] as? String{
                                        self .countryLabel.text = "Country: \(country)"
                                    }
                                }
                                
                                if let city = jsonResponse?["name"] as? String {
                                    self.cityLabel.text = "City: \(city)"
                                    }
                                
                                if let weatherArray = jsonResponse?["weather"] as? [[String: Any]],
                                    let weather = weatherArray.first {
                                    if let main = weather["main"] as? String {
                                        print(main)
                                        self.weatherLabel.text = main
                                    }
                                }

                                }
                        } catch {
                            print("Error Response")
                        }
                    }
                }
            }
            task.resume()
        } else {
            print("Location not available yet.")
        }
    }
    
    
    
    
}



