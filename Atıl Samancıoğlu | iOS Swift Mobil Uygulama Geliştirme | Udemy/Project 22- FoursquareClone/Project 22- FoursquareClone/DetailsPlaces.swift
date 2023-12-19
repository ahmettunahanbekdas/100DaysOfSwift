//
//  DetailsPlaces.swift
//  Project 22- FoursquareClone
//
//  Created by Ahmet Tunahan Bekdaş on 15.12.2023.
//

import UIKit
import MapKit
import Parse

class DetailsPlaces: UIViewController {
    // MARK: - @IBOutlet

    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsPlaceName: UILabel!
    @IBOutlet weak var detailsPlaceType: UILabel!
    @IBOutlet weak var detailsPlaceComment: UILabel!
    @IBOutlet weak var detailsMapView: MKMapView!
    
    var chosenPlaceID: String?
    
    var chosenLatitude: Double?
    var chosenLongitude: Double?
    
    
    
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        getPlaceData()
        
    }
    

    
    func getPlaceData() {
        let query = PFQuery(className: "Place")
        query.whereKey("objectId", equalTo: chosenPlaceID!)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            }else{
                if objects != nil{
                    let chosenPlaceObject = objects![0]
                    
                    if let placesName = chosenPlaceObject.object(forKey: "name") as? String {
                        self.detailsPlaceName.text = placesName
                    }
                    if let placesType = chosenPlaceObject.object(forKey: "type") as? String {
                        self.detailsPlaceType.text = placesType
                    }
                    if let placesComment = chosenPlaceObject.object(forKey: "comment") as? String {
                        self.detailsPlaceComment.text = placesComment
                    }
                    if let placesDoubleLatitude = chosenPlaceObject.object(forKey: "latitude") as? Double {
                        self.chosenLatitude = placesDoubleLatitude
                    }
                    if let placesDoubleLobgiude = chosenPlaceObject.object(forKey: "longitude") as? Double {
                        self.chosenLongitude = placesDoubleLobgiude
                    }
                    if let imageData = chosenPlaceObject.object(forKey: "image") as? PFFileObject {
                        imageData.getDataInBackground { data, error in
                            if error == nil {
                                self.detailsImageView.image = UIImage(data: data!)
                            }
                        }
                    }
                }
                
                // MAPS
                
                let locations = CLLocationCoordinate2D(latitude: self.chosenLatitude!, longitude: self.chosenLongitude!)
                
                let span = MKCoordinateSpan(latitudeDelta: 0.035, longitudeDelta: 0.035)
                
                let region = MKCoordinateRegion(center: locations, span: span)
                
                self.detailsMapView.setRegion(region, animated: true)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = locations
                annotation.title = self.detailsPlaceName.text
                self.detailsMapView.addAnnotation(annotation)
            }
        }

    }
}
