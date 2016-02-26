//
//  Constants.swift
//  OnTheMap
//
//  Created by Mrudul Pendharkar on 11/02/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//

import Foundation

extension OTMHTTPClient{
    struct StudentLocationKeys {
        static let CREATED_AT = "createdAt";
        static let FIRST_NAME = "firstName";
        static let LAST_NAME = "lastName";
        static let LATITUDE = "latitude";
        static let LONGITUDE = "longitude";
        static let MAP_STRING = "mapString";
        static let MEDIA_URL = "mediaURL";
        static let OBJECT_ID = "objectId";
        static let UNIQUE_KEY = "uniqueKey";
        static let UPDATED_AT = "updatedAt";
    }
    
    struct ParameterKeys {
        static let PARSE_API_KEY = "X-Parse-Rest-API-Key"
        static let PARSE_APP_ID = "X-Parse-Application-Id"
    }
    
    struct Constants {
        static let PARSE_API_ID = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr";
        static let PARSE_API_KEY = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY";
        static let BASE_URL = "https://api.parse.com/1/classes/StudentLocation";
    }
}