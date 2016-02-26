//
//  OTMHttpModerator.swift
//  OnTheMap
//
//  Created by Mrudul Pendharkar on 18/02/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//

import Foundation

extension OTMHTTPClient {
    
    enum Status{
        case PASS
        case FAIL
    }

    func getStudentLocations(completionHandler:(result:Status,errorString:String!)->Void){
        //Should update DB?
        let params = ["limit":100]
        taskForGETMethod("", parameters: params) { (result, error) -> Void in
            if let error = error {
                let err = "Fetching Student data failed with \(error.description)"
                completionHandler(result: Status.FAIL, errorString: err)
            }
            else{
                if let results = result["results"] as? [[String:AnyObject]] {
                    LocatorsDB.sharedDBInstance().setStudentLocators(Locator.locatorsFromResults(results))
                    completionHandler(result: Status.PASS, errorString: nil)
                }

            }
        }
    }
//    queryStudent
//    ValidateLogin
}