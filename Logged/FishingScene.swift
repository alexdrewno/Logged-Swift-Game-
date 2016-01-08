import SpriteKit
class FishingScene : SKScene
{
    
    let sceneNode : SKSpriteNode = SKSpriteNode(imageNamed: "Fishing Scene Background")
    let fish : SKSpriteNode = SKSpriteNode(imageNamed: "Fish Sprite")
    let label : SKLabelNode = SKLabelNode(text: "type 'Done Fishing' when done")
    var timer : NSTimer!
    let countLabel : SKLabelNode = SKLabelNode(text: "Fish caught: 0")
    var count : Int = 0
    var running : Bool = false
    
    override func didMoveToView(view: SKView)
    {
        sceneNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        sceneNode.zPosition = -1
        label.position = CGPoint(x: self.size.width/2, y: self.size.height/2 - 15)
        label.fontName = "American Typewriter"
        label.fontSize = 10
        label.fontColor = UIColor.whiteColor()
        countLabel.position = CGPoint(x: self.size.width/2, y: self.size.height - 50)
        countLabel.fontName = "American Typewriter"
        countLabel.fontSize = 10
        countLabel.fontColor = UIColor.whiteColor()
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "fishing", userInfo: nil, repeats: true)
        
        addChild(countLabel)
        addChild(sceneNode)
        addChild(label)
        
    }
    
    func fishing() -> Int
    {
        fish.position = CGPoint(x: CGFloat(arc4random() % (UInt32)(size.width)), y: size.height - CGFloat(arc4random() % (UInt32)(size.height/2)))
        addChild(fish)
        delay(0.4)
            {
                self.fish.position = CGPoint(x: 1000,y: 1000)
                self.fish.removeFromParent()
            }
        
        return count
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches
        {
            let location = touch.locationInNode(self)
            if fish.containsPoint(location)
            {
                ++count
                countLabel.text = "Fish caught: \(count)"
            }
        }
    }
    
    
    //delay function found on the internet
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}