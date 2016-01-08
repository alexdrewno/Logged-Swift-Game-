import UIKit

class Missions: UITableViewController
{
    var Missions : [String] = ["Discover the world"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Missions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell" , forIndexPath: indexPath) as! MissonsCell
        
        let method = Missions[indexPath.row]
        cell.textLabel?.text = method
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let indexPath = tableView.indexPathForSelectedRow!
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! MissonsCell!
        
        if currentCell.textLabel!.text == "Collect 3 fish"
        {
            presentViewController(mission0(), animated: false, completion: nil)
        }
        
        if currentCell.textLabel?.text == "Discover the world"
        {
            
        }
    }
    
    @IBAction func displayButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
}
