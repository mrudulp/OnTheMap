//
//  MapViewController.swift
//  OnTheMap
//
//  Created by Mrudul Pendharkar on 08/02/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var backgroundGradient:CAGradientLayer!
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createAnnotationsFromLocators()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createAnnotationsFromLocators() -> Void{
        
        let count = LocatorsDB.sharedDBInstance().getStudentCount()
        for(var i=0; i < count; i++){
            let locator = LocatorsDB.sharedDBInstance().getItemAtIndex(i)
//            let annotation:MKAnnotation =  MKAnnotation()
//            annotation.title = locator.firstName
//            
            let annotationPoint = MKPointAnnotation.init()
            annotationPoint.title = "\(locator.firstName) \(locator.lastName)"
            annotationPoint.coordinate = CLLocationCoordinate2D(latitude: locator.latitude, longitude: locator.longitude)
            mapView.addAnnotation(annotationPoint)
        }

    }
    
}