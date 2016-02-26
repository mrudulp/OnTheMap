//
//  Locator.swift
//  OnTheMap
//
//  Created by Mrudul Pendharkar on 08/02/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//

import Foundation
import UIKit

struct Locator {
    var createdAt:String!
    var firstName:String!
    var lastName:String!
    var latitude:Double!
    var longitude:Double!
    var mapString:String!
    var mediaUrl:String!
    var objectId:String!
    var uniqueKey:String!
    var updatedAt:String!

    /* Construct a Locator from a dictionary */
    init(dictionary: [String : AnyObject]) {
        createdAt = dictionary[OTMHTTPClient.StudentLocationKeys.CREATED_AT] as! String
        firstName = dictionary[OTMHTTPClient.StudentLocationKeys.FIRST_NAME] as! String
        lastName = dictionary[OTMHTTPClient.StudentLocationKeys.LAST_NAME] as! String
        latitude = dictionary[OTMHTTPClient.StudentLocationKeys.LATITUDE] as! Double
        longitude = dictionary[OTMHTTPClient.StudentLocationKeys.LONGITUDE] as! Double
        mapString = dictionary[OTMHTTPClient.StudentLocationKeys.MAP_STRING] as! String
        mediaUrl = dictionary[OTMHTTPClient.StudentLocationKeys.MEDIA_URL] as! String
        objectId = dictionary[OTMHTTPClient.StudentLocationKeys.OBJECT_ID] as! String
        uniqueKey = dictionary[OTMHTTPClient.StudentLocationKeys.UNIQUE_KEY] as! String
        updatedAt = dictionary[OTMHTTPClient.StudentLocationKeys.UPDATED_AT] as! String
    }
    
    /* Return Locator objects from JSON */
    static func locatorsFromResults(results: [[String:AnyObject]])-> [Locator]{
        var locators = [Locator]()
        
        for result in results {
            locators.append(Locator(dictionary: result))
        }
        return locators
    }
    
}