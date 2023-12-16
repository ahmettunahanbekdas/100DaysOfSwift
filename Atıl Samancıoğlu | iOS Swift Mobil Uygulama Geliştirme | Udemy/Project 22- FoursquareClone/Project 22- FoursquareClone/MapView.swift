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

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveButton))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButton))

        // Map ve Location Manager ayarları
        mapView.delegate = self
        locationMenager.delegate = self
        locationMenager.desiredAccuracy = kCLLocationAccuracyBest
        locationMenager.requestWhenInUseAuthorization()
        locationMenager.startUpdatingLocation()
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(gestureRecognizer)

    }
    
    
    // MARK: - longPress

    @objc func longPress(gestureRecognizer:UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began {
            let touchedPoint = gestureRecognizer.location(in: mapView)
            let touchedPointCordinates = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
            
            PlacesModel.sharedInstance.placesLatitude = touchedPointCordinates.latitude
            PlacesModel.sharedInstance.placesLongitude = touchedPointCordinates.longitude
            
            let annotations = MKPointAnnotation()
            
            annotations.coordinate = touchedPointCordinates
            annotations.title = PlacesModel.sharedInstance.placesName
            annotations.subtitle = PlacesModel.sharedInstance.placesType
            
            mapView.addAnnotation(annotations)
            
            
        }
    }
    
    // MARK: - didUpdateLocations

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationMenager.stopUpdatingLocation()
        let locations = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locations, span: span)
        mapView.setRegion(region, animated: true)
    }

    // MARK: - saveButton

    @objc func saveButton() {
        print("Saved Locations")
        
        let parseObject = PFObject(className: "Place")
        let place = PlacesModel.sharedInstance
        parseObject["name"] = place.placesName
        parseObject["type"] = place.placesType
        parseObject["comment"] = place.placesComment
        parseObject["latitude"] = place.placesLatitude
        parseObject["longitude"] = place.placesLongitude
        
        if let imageData = place.placesImage.jpegData(compressionQuality: 0.5){
              let imageFile = PFFileObject(name: "image.jpg ", data: imageData)
              parseObject["image"] = imageFile
          }
        
        parseObject.saveInBackground { succes, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            }else {
                self.performSegue(withIdentifier: "toTableView", sender: nil)
            }
        }
    }
    
    
    
    
    // MARK: - backButton

    @objc func backButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
