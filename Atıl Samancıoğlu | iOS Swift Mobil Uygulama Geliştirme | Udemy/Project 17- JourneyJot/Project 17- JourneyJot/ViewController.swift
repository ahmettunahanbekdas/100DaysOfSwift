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
    
    
    // MARK: - Functions

    
    
    // MARK: - locationManagec Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if selectedName == "" {
            let locations = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
            let region = MKCoordinateRegion(center: locations, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    // MARK: - MKMapViewDelegate Methods
    
    // Pin görünümü için fonksiyon
    // Bu fonksiyon, harita üzerindeki pin'lerin görünümünü özelleştirmek için kullanılır.
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Eğer annotation kullanıcının konumu ise, özel bir pin gösterilmez.
        if annotation is MKUserLocation {
            return nil
        }
        
        // Kullanılacak pin'in tanımlayıcısı (identifier)
        let reuseId = "myAnnotation"
        
        // Daha önceden kullanılmış bir pin var mı kontrol edilir.
        // Eğer yoksa, yeni bir MKMarkerAnnotationView oluşturulur.
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
        
        if pinView == nil {
            // Yeni pin oluşturulur ve gerekli özellikleri ayarlanır.
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true  // Pin üzerine tıklanınca açıklama gösterilmesini sağlar.
            pinView?.tintColor = .systemBlue  // Pin'in rengini belirler.
            
            // Sağ üst köşede bir detay butonu eklenir.
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        } else {
            // Daha önce kullanılmış bir pin varsa, mevcut annotation'a atanır.
            pinView?.annotation = annotation
        }
        // Hazırlanan pin görünümü geri döndürülür.
        return pinView
    }
    
    
    // Pinin baloncuğunda çıkan detay simgesine tıklandığında oluşucak fonksiyon ve navigasyonu başlatıcak
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let requestLocation = CLLocation(latitude: annotatoionLatitude, longitude: annotationLongitude)
        
        CLGeocoder().reverseGeocodeLocation(requestLocation) { (placemarks, error) in
            
            if let placemark = placemarks {
                if placemark.count > 0 {
                    
                    let newPlacemark = MKPlacemark(placemark: placemark[0])
                    let item = MKMapItem(placemark: newPlacemark)
                    item.name = self.annotationName
                    let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                    item.openInMaps(launchOptions: launchOptions)
                }
            }
        }
    }
    

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

/*

*/
