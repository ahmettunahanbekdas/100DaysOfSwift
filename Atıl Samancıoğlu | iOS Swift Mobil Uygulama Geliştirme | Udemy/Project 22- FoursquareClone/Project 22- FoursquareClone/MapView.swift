//
//  MapView.swift
//  Project 22- FoursquareClone
//
//  Created by Ahmet Tunahan Bekdaş on 14.12.2023.
//

import UIKit
import MapKit
import Parse



class MapView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    // MARK: - @IBOutlet

    @IBOutlet weak var mapView: MKMapView!
    var locationMenager = CLLocationManager()
    
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Map ve Location Manager ayarları
        mapView.delegate = self
        locationMenager.delegate = self
        locationMenager.desiredAccuracy = kCLLocationAccuracyBest
        locationMenager.requestWhenInUseAuthorization()
        locationMenager.startUpdatingLocation()
        
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveButton))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButton))
        
    }
    

    
    @objc func saveButton() {
        print("Saved Locatios")
    }
    
    @objc func backButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
