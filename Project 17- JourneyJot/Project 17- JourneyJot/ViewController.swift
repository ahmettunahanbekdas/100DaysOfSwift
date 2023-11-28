//
//  ViewController.swift
//  Project 17- JourneyJot
//
//  Created by Ahmet Tunahan Bekdaş on 26.11.2023.
//

import UIKit
import MapKit
import CoreLocation // Kullanıcı konumunu almak için kullanılır
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIApplicationDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager() // Kullanıcının konumu ile ilgili işlemler yapmak için bu objeyi kullanmak gerekiyor
    
    var chosenLongitude = Double()
    var chosenLatitude = Double()
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // Kullanıcının konumunun netliğini belirler
        locationManager.requestWhenInUseAuthorization() // Kullanıcının konumu ne kadar istenecek
        locationManager.startUpdatingLocation() // // Kullanıcının konumu alınmaya başlandı
        
        
        let gesturRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))// Uzun basılı tutma hareketini algılamak için bir UILongPressGestureRecognizer öğesi oluşturuluyor.
        gesturRecognizer.minimumPressDuration = 2 // Uzun basılı tutma hareketinin algılanması için minimum basılma süresi belirleniyor (2 saniye)
        mapView.addGestureRecognizer(gesturRecognizer)  // Harita görünümüne oluşturulan uzun basılı tutma tanımlayıcısı ekleniyor.
        
        // Ekranın bir yerine tıklama yapıldığında ki hareketi algılar ve "closeKeyboard" fonksiyonunu çağırır
        let tapView = UITapGestureRecognizer.init(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tapView)
    }
    
    // MARK: - Funcitons
    
    // Klave kapama fonksiyonudur ve çağrılır
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    // Uzun basılı tutma hareketi algılandığında çağrılan bir fonksiyonu temsil eder
    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer) {
        // Uzun basılı tutma hareketi başladığında yapılacak işlemler
        if gestureRecognizer.state == .began {
            // Basılan noktayı almak için kullanılır
            let touchedPoint = gestureRecognizer.location(in: mapView)
            // Harita üzerindeki dokunulan noktayı koordinatlara dönüştürür
            let touchedCoordinates = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
            
            chosenLatitude = touchedCoordinates.latitude
            chosenLongitude = touchedCoordinates.longitude
            
            
            // Yeni bir MKPointAnnotation nesnesi oluşturulur ve dokunulan koordinatlar atanır
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
            annotation.title = nameText.text
            annotation.subtitle = commentText.text
            
            // Oluşturulan annotation haritaya eklenir
            mapView.addAnnotation(annotation)
        }
    }

    // "didUpdateLocations" fonksiyonu güncellenen lokasyonları dizi içersinde verir
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude) // 0. Sırada ki kullanıcının kordinatları alındı
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005) // Kordinatlara yapılıcak olan zoom oranı ayarlandı
        let region = MKCoordinateRegion(center: locations, span: span) // Kordinatlar ve zoom oranı birleştirilerek Regiona(Bölgeye) atandı
        mapView.setRegion(region, animated: true) // Ayarlanan Region(Bölge) Haritamıza eklendi.
    }
    
    func makeAlert(tittle: String, message: String, okActionTittle:String) {
           let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: okActionTittle, style: .cancel, handler:  nil)
           alert.addAction(okAction)
           self.present(alert, animated: true)
       }
    
    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        if nameText.text!.isEmpty{
            makeAlert(tittle: "Error", message: "Name field cannot be empty", okActionTittle: "Okay")
        }else {
            newPlace.setValue(nameText.text, forKey: "name")

        }
        if commentText.text!.isEmpty{
            makeAlert(tittle: "Error", message: "Comment field cannot be empty", okActionTittle: "Okay")
        }else {
            newPlace.setValue(commentText.text, forKey: "comment")
        }
         
        
          if chosenLatitude == 0.0 || chosenLongitude == 0.0 {
              makeAlert(tittle: "Error", message: "Please select a location on the map", okActionTittle: "Okay")
          } else {
              newPlace.setValue(chosenLatitude, forKey: "latitude")
              newPlace.setValue(chosenLongitude, forKey: "longitude")
          }
        
        newPlace.setValue(UUID(), forKey: "id")
        
        do{
            try context.save()
            makeAlert(tittle: "Succes", message: "Location Be Save ", okActionTittle: "Okay")

        }catch{
            makeAlert(tittle: "Error", message: "Location Could Not Be Saved Try Again", okActionTittle: "Okay")
        }
     
        
    }
    
}


