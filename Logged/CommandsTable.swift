import UIKit

class CommandsTable: UITableViewController
{
    var knownMethods : [String] = ["Move up (MU)", "Move down (MD)"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knownMethods.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell" , forIndexPath: indexPath) as! CommandCell
        
        let method = knownMethods[indexPath.row]
        cell.textLabel?.text = method
        return cell
    }
    
    @IBAction func displayButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
}
