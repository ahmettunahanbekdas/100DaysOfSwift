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
        
        mapView.delegate = self // mapView delegate ekledik
        locationManager.delegate = self // localtionManager delegate ekledik
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // hangi keskinlikte konumu istediğimi belirtiriz keskinlik arttıkça pil kullanımı artar
        locationManager.requestWhenInUseAuthorization() // Ne sıklıkla kullanıcının konumunu istiyoruz burada uygulamayı kullandığı esnada konum bilgisi alınır
        locationManager.startUpdatingLocation() // Kullanıcının konumunu almaya başladık

    }
    


}

