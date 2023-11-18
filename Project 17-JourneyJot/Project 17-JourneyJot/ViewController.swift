//
//  ViewController.swift
//  Project 17-JourneyJot
//
//  Created by Ahmet Tunahan Bekdaş on 12.11.2023.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var placeText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager() // Lokasyon kontrolü için obje oluşturduk
    
    var chosenLongitude = Double()
    var chosenLatitude = Double()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self // Harita işlemleri için delegate'i ViewController'a atıyoruz
        locationManager.delegate = self // Konum işlemleri için delegate'i ViewController'a atıyoruz
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // Konumun hassasiyetini belirtiyoruz; en yüksek hassasiyeti seçtik, pil tüketimi artabilir
        locationManager.requestWhenInUseAuthorization() // Uygulama kullanılırken konum bilgisine ihtiyaç duyduğumuzu belirtiyoruz
        locationManager.startUpdatingLocation() // Kullanıcının konumunu almaya başlıyoruz
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(choseLocation(gestureRecoginer:)))
        gestureRecognizer.minimumPressDuration = 3 // Kullanıcının minimum kaç saniye tıklaması gerektiği belirtilir.
        mapView.addGestureRecognizer(gestureRecognizer) // mapView içersine ekleme işlemi geçekleştirildi
    }
    
    @objc func choseLocation(gestureRecoginer: UILongPressGestureRecognizer) {
        // 1. Uzun basma jestini algılandığı noktayı alır
        let touchPoint = gestureRecoginer.location(in: self.mapView)
        // 2. Haritadaki dokunulan noktayı koordinat sistemi üzerinde alır
        let touchedCoordinates = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        // 3. Bir MKPointAnnotation örneği oluşturur
        chosenLongitude = touchedCoordinates.longitude
        chosenLatitude = touchedCoordinates.latitude
        let annotation = MKPointAnnotation()
        // 4. Annotation'ın koordinatını dokunulan koordinata ayarlar
        annotation.coordinate = touchedCoordinates
        // 5. Annotation'ın başlığını belirler
        annotation.title = placeText.text
        // 6. Annotation'ın alt başlığını belirler
        annotation.subtitle = commentText.text
        // 7. Haritaya oluşturulan annotation'ı ekler
        self.mapView.addAnnotation(annotation)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        // Yeni konum bilgisini alıp, CLLocationCoordinate2D formatına dönüştürüyoruz
        
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        // MapView'da gösterilecek bölgenin genişliğini ve yüksekliğini belirlemek için bir MKCoordinateSpan oluşturuyoruz
        // Burada 0.1 değerleri, görüntülenen bölgenin enlem ve boylamındaki farklılık aralıklarını temsil eder
        
        let region = MKCoordinateRegion(center: locations, span: span)
        // MKCoordinateRegion, belirtilen konum ve görüntüleme aralığını birleştirerek bir bölge oluşturur
    
        mapView.setRegion(region, animated: true)
        // Oluşturduğumuz bölgeyi haritaya setRegion fonksiyonu ile belirterek haritada o bölgenin gösterilmesini sağlarız
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelagete = UIApplication.shared.delegate as! AppDelegate
        let context = appDelagete.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(placeText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        
        newPlace.setValue(UUID(), forKey: "id")
        do {
          try context.save()
          print("Succes")
        }catch{
            print("Error")
        }

    }
    
}

