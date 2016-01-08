import UIKit
class mission0: UIViewController
{
    override func viewDidLoad()
    {
        let l : UITextView = UITextView(frame: CGRectMake(view.frame.size.width/2, view.frame.size.height/3, view.frame.size.width, 150))
        l.text = "The old man inside the cabin asked for some fish ... I think I can get some at the pond on the right side of where I first began..."
        l.textAlignment = NSTextAlignment.Center
        l.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/3)
        l.font = UIFont(name: "American Typewriter", size: 20)
        l.editable = false
        
        let l2 : UITextView = UITextView(frame: CGRectMake(view.frame.size.width/2, view.frame.size
            .height/2, view.frame.size.width, 100))
        l2.text = "Reward: ???"
        l2.textAlignment = NSTextAlignment.Center
        l2.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height - view.frame.size.height/3)
        l2.font = UIFont(name: "American Typewriter", size: 50)
        l2.editable = false
        
        let b1 : UIButton = UIButton(frame: CGRectMake(0, 20, 75, 32))
        b1.setTitle("return", forState: .Normal)
        b1.setTitleColor(UIColor.blueColor(), forState: .Normal)
        b1.addTarget(self, action: "returnToMissions", forControlEvents: UIControlEvents.TouchUpInside)
        b1.tintColor = UIColor.blackColor()
        
        self.view.addSubview(l)
        self.view.addSubview(l2)
        self.view.addSubview(b1)
        view.backgroundColor = UIColor.whiteColor()
    }
    
    func returnToMissions()
    {
        dismissViewControllerAnimated(false, completion: nil)
    }
}