//
//  ViewController.swift
//  Project 17-JourneyJot
//
//  Created by Ahmet Tunahan Bekdaş on 12.11.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager() // Lokasyon kontrolü için obje oluşturduk
    
    
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
    
    @objc func choseLocation(gestureRecoginer: UILongPressGestureRecognizer){
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        // Yeni konum bilgisini alıp, CLLocationCoordinate2D formatına dönüştürüyoruz
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        // MapView'da gösterilecek bölgenin genişliğini ve yüksekliğini belirlemek için bir MKCoordinateSpan oluşturuyoruz
        // Burada 0.1 değerleri, görüntülenen bölgenin enlem ve boylamındaki farklılık aralıklarını temsil eder
        
        let region = MKCoordinateRegion(center: locations, span: span)
        // MKCoordinateRegion, belirtilen konum ve görüntüleme aralığını birleştirerek bir bölge oluşturur
    
        mapView.setRegion(region, animated: true)
        // Oluşturduğumuz bölgeyi haritaya setRegion fonksiyonu ile belirterek haritada o bölgenin gösterilmesini sağlarız
    }
}

