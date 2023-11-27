//
//  ViewController.swift
//  Project 17- JourneyJot
//
//  Created by Ahmet Tunahan Bekdaş on 26.11.2023.
//

import UIKit
import MapKit
import CoreLocation // Kullanıcı konumunu almak için kullanılır

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager() // Kullanıcının konumu ile ilgili işlemler yapmak için bu objeyi kullanmak gerekiyor
    
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
    }
    
    // MARK: - Funcitons
    
    // Uzun basılı tutma hareketi algılandığında çağrılan bir fonksiyonu temsil eder
    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer) {
        // Uzun basılı tutma hareketi başladığında yapılacak işlemler
        if gestureRecognizer.state == .began {
            // Basılan noktayı almak için kullanılır
            let touchedPoint = gestureRecognizer.location(in: mapView)
            // Harita üzerindeki dokunulan noktayı koordinatlara dönüştürür
            let touchedCoordinates = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
            
            // Yeni bir MKPointAnnotation nesnesi oluşturulur ve dokunulan koordinatlar atanır
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
            annotation.title = "New Annotation Title"
            annotation.subtitle = "New Annotation Subtitle"
            
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

}


