//
//  SecondVC.swift
//  HRM
//
//  Created by akash savediya on 16/05/17.
//  Copyright © 2017 akash savediya. All rights reserved.
//

import UIKit
import MapKit

class SecondVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var theMap: MKMapView!
    @IBOutlet weak var DateLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        map();
        
        // For Date
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        DateLbl.text = "\(formatter.string(from: date))"
        
    }
    
    
    
    
    func map() {
        theMap.delegate = self
        theMap.mapType = MKMapType.standard
        theMap.isZoomEnabled = true
        theMap.showsUserLocation = true
        theMap.userTrackingMode = MKUserTrackingMode(rawValue: 2)!
        return
    }

    
    @IBAction func punchBut(_ sender: Any) {
        
        performSegue(withIdentifier: "punchSegue", sender: nil)
    }


    
}
