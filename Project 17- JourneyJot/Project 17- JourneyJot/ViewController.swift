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
        
        
    }
    
    // "didUpdateLocations" fonksiyonu güncellenen lokasyonları dizi içersinde verir
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: locations, span: span)
        mapView.setRegion(region, animated: true)
    }

}


