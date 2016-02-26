//
//  PinListController.swift
//  OnTheMap
//
//  Created by Mrudul Pendharkar on 08/02/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//

import Foundation
import UIKit

class PinListController: UITableViewController{//UIViewController, UITableViewDelegate, UITableViewDataSource{
    
//    @IBOutlet weak var tableView: UITableView!
    
    var maxRows = 20
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocatorsDB.sharedDBInstance().getStudentCount()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let locator = LocatorsDB.sharedDBInstance().getItemAtIndex(indexPath.row)
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "\(locator.firstName) \(locator.lastName)"
        cell.detailTextLabel?.text = "\(locator.mediaUrl)"
        
        return cell
    }
}
