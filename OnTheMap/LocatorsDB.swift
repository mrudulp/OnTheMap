//
//  LocatorsDB.swift
//  OnTheMap
//
//  Created by Mrudul Pendharkar on 08/02/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//

import Foundation
import UIKit

class LocatorsDB {
//    var studentLocators:NSDictionary!
    let MAX = 10
    var studentLocators:[Locator]!
    
    
    // Max no of Json Objs to return
    func getMaxCount() -> Int{
        return MAX
    }
    
    func getStudentCount()->Int{
        return studentLocators.count
    }
    
    func getItemAtIndex(idx:Int) ->Locator{
        return studentLocators[idx]
    }
    
    func setStudentLocators(locators:[Locator])->Void{
        studentLocators = locators
    }
    
    class func sharedDBInstance()->LocatorsDB{
        struct Singleton {
            static var sharedInstance = LocatorsDB()
        }
        return Singleton.sharedInstance
    }
}