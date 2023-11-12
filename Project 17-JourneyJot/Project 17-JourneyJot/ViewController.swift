//
//  ViewController.swift
//  Project 17-JourneyJot
//
//  Created by Ahmet Tunahan Bekdaş on 12.11.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        
        mapView.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}

