import SpriteKit

class CabinScene: SKScene
{
    let sceneNode : SKSpriteNode = SKSpriteNode(imageNamed: "Cabin Sprite")
    var player: SKSpriteNode = SKSpriteNode(imageNamed: "player sprite 1")
    
    override func didMoveToView(view: SKView)
    {
        sceneNode.position = CGPoint(x: (scene?.size.width)!/2, y: (scene?.size.height)!/2 + 200)
        sceneNode.zPosition = -1
        player.position = CGPoint(x: sceneNode.position.x, y: sceneNode.position.y - 100)
        self.backgroundColor = UIColor.blackColor()
        scene?.scaleMode = .ResizeFill
        
        
        
        addChild(player)
        addChild(sceneNode)
    }
    func moveUp() -> Bool
    {
        
        if !canMoveUp()
        {
            return false
        }
        if checkIfVerticalEdge()
        {
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.2))))
            sceneNode.runAction(SKAction.moveToY(sceneNode.position.y - 30, duration: NSTimeInterval(0.8)), completion: {self.player.removeAllActions()})
            
            return true
        }
        else
        {
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.2))))
            player.runAction(SKAction.moveToY(player.position.y + 30, duration: NSTimeInterval(0.8)), completion: {self.player.removeAllActions()})
            return true
        }
        
    }
    
    func moveDown() -> Bool
    {
        if !canMoveDown()
        {
            return false
        }
        
        if checkIfVerticalEdge()
        {
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.2))))
            sceneNode.runAction(SKAction.moveToY(sceneNode.position.y + 30, duration: NSTimeInterval(0.8)), completion: {self.player.removeAllActions()})
            
            return true
        }
        else
        {
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.2))))
            player.runAction(SKAction.moveToY(player.position.y - 30, duration: NSTimeInterval(0.8)), completion: {self.player.removeAllActions()})
            return true
        }
    }
    
    func moveLeft() -> Bool
    {
        if !canMoveLeft()
        {
            return false
        }
        if checkIfHorizontalEdge()
        {
            player.xScale = -1
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.2))))
            sceneNode.runAction(SKAction.moveToX(sceneNode.position.x + 30, duration: NSTimeInterval(0.8)), completion: {self.player.removeAllActions()})
            
            return true
        }
        else
        {
            player.xScale = -1
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.2))))
            player.runAction(SKAction.moveToX(player.position.x - 30, duration: NSTimeInterval(0.8)), completion: {self.player.removeAllActions()})
            return true
        }
        
    }
    
    func moveRight() -> Bool
    {
        if !canMoveRight()
        {
            return false
        }
            
        else if checkIfHorizontalEdge()
        {
            player.xScale = 1
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.2))))
            sceneNode.runAction(SKAction.moveToX(sceneNode.position.x - 30, duration: NSTimeInterval(0.8)), completion: {self.player.removeAllActions()})
            return true
        }
        else
        {
            player.xScale = 1
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.2))))
            player.runAction(SKAction.moveToX(player.position.x + 30, duration: NSTimeInterval(0.8)), completion: {self.player.removeAllActions()})
            return true
        }
    }
    
    func checkIfHorizontalEdge() -> Bool
    {
        if(abs(sceneNode.position.x - player.position.x)) >= 85
        {
            return false
        }
        return true
    }
    
    func checkIfVerticalEdge() -> Bool
    {
        if sceneNode.position.y - player.position.y >= 145 || sceneNode.position.y - player.position.y <= -50
        {
            return false
        }
        return true
    }
    
    
    func canMoveRight() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        print("yDif \(yDif)","xDif \(xDif)")
        
        
        //right of map
        if xDif >= 175
        {
            return false
        }
        return true
    }
    
    func canMoveLeft() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        print("yDif \(yDif)","xDif \(xDif)")
        
        //left of map
        if xDif <= -175
        {
            return false
        }
        return true
    }
    
    func canMoveUp() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        print("yDif \(yDif)","xDif \(xDif)")
        
        //top of map
        if yDif >= 170
        {
            return false
        }
        
        return true
    }
    
    func canMoveDown() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        print("yDif \(yDif)","xDif \(xDif)")
        
        //bottom of map
        if yDif <= -160
        {
            return false
        }
        
        return true
    }
    
    func talk() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        //guy in middle
        if xDif <= 35 && xDif >= -35 && yDif <= 180 && yDif >= 100
        {
            return true
        }
        return false
    }
    
    func travel() -> Int
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        if yDif <= -140 && xDif >= -30 && xDif <= 30
        {
            return 0
        }
        return -1
    }
    
}