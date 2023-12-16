//
//  DetailsPlaces.swift
//  Project 22- FoursquareClone
//
//  Created by Ahmet Tunahan Bekdaş on 15.12.2023.
//

import UIKit
import MapKit

class DetailsPlaces: UIViewController {
    // MARK: - @IBOutlet

    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsPlaceName: UILabel!
    @IBOutlet weak var detailsPlaceType: UILabel!
    @IBOutlet weak var detailsPlaceComment: UILabel!
    @IBOutlet weak var detailsMapView: MKMapView!
    
    var chosenPlaceID: String?
    
    
    
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(chosenPlaceID!)
        
    }
    


}
