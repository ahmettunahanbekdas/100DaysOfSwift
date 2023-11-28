//
//  ViewController.swift
//  Project 17- JourneyJot
//
//  Created by Ahmet Tunahan Bekdaş on 26.11.2023.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIApplicationDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Properties
    var locationManager = CLLocationManager()
    var chosenLongitude = Double()
    var chosenLatitude = Double()
    var selectedName = ""
    var selectedId : UUID?
    var annotationName = ""
    var annotationComment = ""
    var annotatoionLatitude = Double()
    var annotationLongitude = Double()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Map ve Location Manager ayarları
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Uzun basılı tutma gesture'ı ekleniyor
        let gesturRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gesturRecognizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(gesturRecognizer)
        
        // Ekranın herhangi bir yerine tıklama gesture'ı ekleniyor
        let tapView = UITapGestureRecognizer.init(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tapView)
        
        // Eğer bir mekan seçilmişse
        if selectedName != "" {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            let idString = selectedId!.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKey: "name") as? String {
                            annotationName = name
                        }
                        if let comment = result.value(forKey: "comment") as? String {
                            annotationComment = comment
                        }
                        if let latitude = result.value(forKey: "latitude") as? Double {
                            annotatoionLatitude = latitude
                        }
                        if let longitude = result.value(forKey: "longitude") as? Double {
                            annotationLongitude = longitude
                        }
                        
                        // Mekanın pin'i oluşturuluyor
                        let annotation = MKPointAnnotation()
                        annotation.title = annotationName
                        annotation.subtitle = annotationComment
                        let cordinate = CLLocationCoordinate2D(latitude: annotatoionLatitude, longitude: annotationLongitude)
                        annotation.coordinate = cordinate
                        
                        mapView.addAnnotation(annotation)
                        nameText.text = annotationName
                        commentText.text = annotationComment
                        
                        locationManager.stopUpdatingLocation()
                        
                        let span = MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)
                        let region = MKCoordinateRegion(center: cordinate, span: span)
                        mapView.setRegion(region, animated: true)
                    }
                }
            } catch {
                print("Error")
            }
            saveButton.isHidden = true
        }
    }
    
    // MARK: - CLLocationManagerDelegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if selectedName == "" {
            let locations = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            let region = MKCoordinateRegion(center: locations, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    // MARK: - MKMapViewDelegate Methods
    
    // Pin görünümü için fonksiyon
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "myAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
        
        if pinView == nil {
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.tintColor = .systemBlue
            
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    // MARK: - Functions
    
    // Uzun basılı tutma gesture'ı ile konum seçme
    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchedPoint = gestureRecognizer.location(in: mapView)
            let touchedCoordinates = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
            
            chosenLatitude = touchedCoordinates.latitude
            chosenLongitude = touchedCoordinates.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
            annotation.title = nameText.text
            annotation.subtitle = commentText.text
            
            mapView.addAnnotation(annotation)
        }
    }
    
    // Klavyeyi kapatma
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    // Alert oluşturma
    func makeAlert(tittle: String, message: String, okActionTittle: String) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okActionTittle, style: .cancel, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    // Kaydet butonu işlevi
    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        if nameText.text!.isEmpty {
            makeAlert(tittle: "Error", message: "Name field cannot be empty", okActionTittle: "Okay")
        } else {
            newPlace.setValue(nameText.text, forKey: "name")
        }
        
        if commentText.text!.isEmpty {
            makeAlert(tittle: "Error", message: "Comment field cannot be empty", okActionTittle: "Okay")
        } else {
            newPlace.setValue(commentText.text, forKey: "comment")
        }
        
        if chosenLatitude == 0.0 || chosenLongitude == 0.0 {
            makeAlert(tittle: "Error", message: "Please select a location on the map", okActionTittle: "Okay")
        } else {
            newPlace.setValue(chosenLatitude, forKey: "latitude")
            newPlace.setValue(chosenLongitude, forKey: "longitude")
        }
        
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
        } catch {
            makeAlert(tittle: "Error", message: "Location could not be saved. Please try again.", okActionTittle: "Okay")
        }
        
        // Yeni mekan eklendiğinde, diğer ekranların bu değişiklikten haberdar olması için bir notifikasyon gönderiyoruz.
        NotificationCenter.default.post(name: NSNotification.Name("newPlace"), object: nil)
        
        // Mekan eklendikten sonra, bu ekranı kapatıyoruz.
        navigationController?.popViewController(animated: true)
    }
}

