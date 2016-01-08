//
//  GameScene.swift
//  Logged
//
//  Created by adrewno1 on 11/13/15.
//  Copyright (c) 2015 adrewno1. All rights reserved.
//

import SpriteKit

class HomeScene: SKScene
{
    var sceneNode : SKSpriteNode = SKSpriteNode(imageNamed: "Scene Sprite")
    var player: SKSpriteNode = SKSpriteNode(imageNamed: "player sprite 1")

    
    override func didMoveToView(view: SKView)
    {
        sceneNode.position = CGPoint(x: (scene?.size.width)!/2, y: (scene?.size.height)!/2)
        sceneNode.zPosition = -1
        scaleMode = .ResizeFill
        player.position = CGPoint(x: sceneNode.position.x, y: sceneNode.position.y + 80)
        
        
        addChild(player)
        addChild(sceneNode)
        
    }

    func moveUp() -> Bool
    {
        
        if !canMoveUp()
        {
            return false
        }
        if !checkIfVerticalEdge()
        {
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.175))))
            sceneNode.runAction(SKAction.moveToY(sceneNode.position.y - 35, duration: NSTimeInterval(0.7)), completion: {self.player.removeAllActions()})
            
            return true
        }
        else
        {
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.175))))
            player.runAction(SKAction.moveToY(player.position.y + 35, duration: NSTimeInterval(0.7)), completion: {self.player.removeAllActions()})
            return true
        }

    }
    
    func moveDown() -> Bool
    {
        if !canMoveDown()
        {
            return false
        }
        
        if !checkIfVerticalEdge()
        {
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.175))))
            sceneNode.runAction(SKAction.moveToY(sceneNode.position.y + 35, duration: NSTimeInterval(0.7)), completion: {self.player.removeAllActions()})
            
            return true
        }
        else
        {
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.175))))
            player.runAction(SKAction.moveToY(player.position.y - 35, duration: NSTimeInterval(0.7)), completion: {self.player.removeAllActions()})
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
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.175))))
            sceneNode.runAction(SKAction.moveToX(sceneNode.position.x + 35, duration: NSTimeInterval(0.7)), completion: {self.player.removeAllActions()})
            
            return true
        }
        else
        {
            player.xScale = -1
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.175))))
            player.runAction(SKAction.moveToX(player.position.x - 35, duration: NSTimeInterval(0.7)), completion: {self.player.removeAllActions()})
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
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.175))))
            sceneNode.runAction(SKAction.moveToX(sceneNode.position.x - 35, duration: NSTimeInterval(0.7)), completion: {self.player.removeAllActions()})
            return true
        }
        else
        {
            player.xScale = 1
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures([SKTexture(imageNamed: "player sprite 1"), SKTexture(imageNamed: "player sprite 2")] , timePerFrame: NSTimeInterval(0.175))))
            player.runAction(SKAction.moveToX(player.position.x + 35, duration: NSTimeInterval(0.7)), completion: {self.player.removeAllActions()})
            return true
        }
    }
    
    func checkIfHorizontalEdge() -> Bool
    {
        if(abs(sceneNode.position.x - player.position.x)) >= 175
        {
            return false
        }
        return true
    }
    
    func checkIfVerticalEdge() -> Bool
    {
        let yDif = player.position.y - sceneNode.position.y
        if yDif <= 160 && yDif >= -270
        {
            return false
        }
        return true
    }
    
    
    func canMoveRight() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        print("xDif: \(xDif), yDif: \(yDif)")
        
        //top right pond
        if xDif >= 165 && yDif >= 200
        {
            return false
        }
        
        //right of map
        if xDif >= 320
        {
            return false
        }
        return true
    }
    
    func canMoveLeft() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        print("xDif: \(xDif), yDif: \(yDif)")
        
        //topleft building
        if xDif <= -35 && yDif >= 205
        {
            return false
        }
        
        //left of map
        if xDif <= -320
        {
            return false
        }
        return true
    }
    
    func canMoveUp() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        print("xDif: \(xDif), yDif: \(yDif)")
        
        //topleft Building
        if xDif <= -80 && yDif >= 180
        {
            return false
        }
        //top right pond
        if xDif >= 150 && yDif >= 200
        {
            return false
        }
        //top of map
        if yDif >= 350
        {
            return false
        }
        
        return true
    }
    
    func canMoveDown() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        print("xDif: \(xDif), yDif: \(yDif)")
        
        //bottom of map
        if yDif <= -310
        {
            return false
        }
        return true
    }
    
    
    func read() -> Bool
    {
        if nextToSign()
        {
            return true
        }
        return false
    }
    
    func nextToSign() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        if xDif > -155 && xDif < -105 && yDif > 175
        {
            return true
        }
        return false
    }
    
    func travel() -> Int
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        if (xDif >= -245 && xDif <= -200) && yDif >= 180
        {
            return 1
        }
        return -1
    }
    
    func fishing() -> Bool
    {
        let xDif = player.position.x - sceneNode.position.x
        let yDif = player.position.y - sceneNode.position.y
        
        if (xDif >= 150 && yDif >= 200) || (xDif >= 165 && yDif >= 200)
        {
            return true
        }
        return false
    }
    
    func openingScene()
    {
        let beginningNode = SKLabelNode(text: "To start, type in 'move ...' and a direction (i.e. move left)")
        beginningNode.fontSize = 12
        beginningNode.fontColor = UIColor.whiteColor()
        beginningNode.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        beginningNode.runAction(SKAction.waitForDuration(5), completion: {beginningNode.removeFromParent()})
        beginningNode.fontName = "American Typewriter"
        
        addChild(beginningNode)
    }
    
}
