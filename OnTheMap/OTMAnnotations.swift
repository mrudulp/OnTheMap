//
//  OTMAnnotations.swift
//  OnTheMap
//
//  Created by Mrudul Pendharkar on 26/02/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//

import Foundation
import MapKit

class OTMAnnotation:NSObject,MKAnnotation {
    
    var coordinate:CLLocationCoordinate2D
    var title:String?
    //var myLink:String!
    var subTitle:String?
    
    init(currCoordinate:CLLocationCoordinate2D, currTitle:String, currSubTitle:String){
        self.coordinate = currCoordinate
        self.title = currTitle
        self.subTitle = currSubTitle
        
        super.init()
    }
    
    /* Create Annotations from Locators */
    class func annotationsFromLocators(locators:[Locator])->[OTMAnnotation]{
        var annotations = [OTMAnnotation]()
        for locator in  locators{

            let coord:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: locator.latitude, longitude: locator.longitude)
            let title = "\(locator.firstName) \(locator.lastName)"
            let subTitle = "\(locator.mediaUrl)"
            let annotation = OTMAnnotation.init(currCoordinate: coord, currTitle: title, currSubTitle: subTitle)
            
            annotations.append(annotation)
        }
        return annotations
    }
}