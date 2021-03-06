//
//  OTMClient.swift
//  OnTheMap
//
//  Created by Mrudul Pendharkar on 11/02/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//

import Foundation

class OTMHTTPClient:NSObject{
 
    //Mark: Properties
    
    /*Shared Session*/
    var session:NSURLSession
    
    override init(){
        session = NSURLSession.sharedSession()
        super.init()
    }
    func taskForPOSTMethod(method:String, postData:[String:AnyObject], parameters:[String:AnyObject], completionHandler:(result:AnyObject!,error:NSError?)->Void)->NSURLSessionDataTask{
        return taskForHTTP(method, parameters: parameters, isPOST: true, postData: postData, completionHandler: completionHandler)
    }
    
    func taskForGETMethod(method:String, parameters:[String:AnyObject], completionHandler:(result:AnyObject!,error:NSError?)->Void)->NSURLSessionDataTask{
        return taskForHTTP(method, parameters: parameters, isPOST: false, postData: nil, completionHandler: completionHandler)
    }
    
    private func taskForHTTP(method:String, parameters:[String:AnyObject], isPOST: Bool, postData:[String:AnyObject]!, completionHandler:(result:AnyObject!,error:NSError?)->Void)->NSURLSessionDataTask{
        /* 1. Set the parameters */
        let mutableParameters = parameters
        
        /* 2/3. Build the URL and configure the request */
        let urlString = Constants.BASE_URL + method + OTMHTTPClient.escapedParameters(mutableParameters)
        let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(URL: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(Constants.PARSE_API_KEY, forHTTPHeaderField: ParameterKeys.PARSE_API_KEY)
        request.addValue(Constants.PARSE_API_ID, forHTTPHeaderField: ParameterKeys.PARSE_APP_ID)

        if (isPOST){
            request.HTTPMethod = "POST"
            do {
                request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(postData, options: NSJSONWritingOptions.PrettyPrinted)
            }catch(let e){
                print("Error Json Parsing \(e)")
            }
        }
        
        /* 4. Make the request */
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                print("There was an error with your request: \(error)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else {
                if let response = response as? NSHTTPURLResponse {
                    print("Your request returned an invalid response! Status code: \(response.statusCode)!")
                } else if let response = response {
                    print("Your request returned an invalid response! Response: \(response)!")
                } else {
                    print("Your request returned an invalid response!")
                }
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }
            
            /* 5/6. Parse the data and use the data (happens in completion handler) */
            OTMHTTPClient.parseJSONWithCompletionHandler(data, completionHandler: completionHandler)
        }
        
        /* 7. Start the request */
        task.resume()
        
        return task
        
    }
    
    
    /* Helper: Given raw JSON, return a usable Foundation object */
    class func parseJSONWithCompletionHandler(data: NSData, completionHandler: (result: AnyObject!, error: NSError?) -> Void) {
        
        var parsedResult: AnyObject!
        do {
            parsedResult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
        } catch {
            let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
            completionHandler(result: nil, error: NSError(domain: "parseJSONWithCompletionHandler", code: 1, userInfo: userInfo))
        }
        
        completionHandler(result: parsedResult, error: nil)
    }
    
    /* Helper function: Given a dictionary of parameters, convert to a string for a url */
    class func escapedParameters(parameters: [String : AnyObject]) -> String {
        
        var urlVars = [String]()
        
        for (key, value) in parameters {
            
            /* Make sure that it is a string value */
            let stringValue = "\(value)"
            
            /* Escape it */
            let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
            /* Append it */
            urlVars += [key + "=" + "\(escapedValue!)"]
            
        }
        
        return (!urlVars.isEmpty ? "?" : "") + urlVars.joinWithSeparator("&")
    }
    
    // MARK: Shared Instance
    class func sharedInstance() -> OTMHTTPClient {
        
        struct Singleton {
            static var sharedInstance = OTMHTTPClient()
        }
        
        return Singleton.sharedInstance
    }
}