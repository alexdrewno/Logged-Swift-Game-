//
//  Inventory.swift
//  Logged
//
//  Created by adrewno1 on 12/14/15.
//  Copyright © 2015 adrewno1. All rights reserved.
//

import Foundation
import UIKit

class Inventory: UITableViewController
{
    var inventory : [Item] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell" , forIndexPath: indexPath) as! ItemCell
        
        let method = inventory[indexPath.row]
        cell.body.text =  "\(method.amount)" + " " + method.name
        if (cell.body.text?.lowercaseString.containsString("fish") != nil)
        {
            cell.i.image = UIImage(named: "Fish Sprite")
        }
        return cell
        
    }
            
            
    
    @IBAction func displayButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
}
