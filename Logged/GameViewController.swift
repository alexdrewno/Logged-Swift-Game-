//
//  GameViewController.swift
//  Logged
//
//  Created by adrewno1 on 11/13/15.
//  Copyright (c) 2015 adrewno1. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var command: UITextField!
    @IBOutlet weak var console: UITextView!
    let methods : [String] = ["Talk","Fish","Read","Move up", "Move down", "Move left", "Move right", "MU", "MD", "ML", "MR", "Done Fishing"]
    var knownMethods : [String] = []
    var missions : [String] = ["Explore the world!"]
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var controlView: UIView!
    var sceneNum : Int!
    var scene : HomeScene!
    var cabinScene: CabinScene!
    var fishingScene: FishingScene!
    var skView: SKView!
    var count: Int!
    var inventory : [Item] = []
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        command.delegate = self
        doneButton.hidden = true
        sceneNum = 0
        
        scene = HomeScene(fileNamed:"GameScene")
        cabinScene = CabinScene(fileNamed: "GameScene")
        
            // Configure the view.
        skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
            /* Set the scale mode to scale to fit the window */
        
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
        scene!.openingScene()
        
        
            
        
        console.backgroundColor = UIColor.whiteColor()
        controlView.backgroundColor = UIColor.blackColor()
        console.layer.borderWidth = 1
        console.layer.borderColor = UIColor.whiteColor().CGColor
    }

    override func shouldAutorotate() -> Bool
    {
        return false
    }

 
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var text : String!
        var textFieldText : String!
        textFieldText = textField.text!
        if check(textFieldText)
        {
            
            for var i = 0; i < methods.count; ++i
            {
                
                if sceneNum == 0
                {
                    if (methods[i] == "Move up" || methods[i] == "MU") && methods[i].lowercaseString == textFieldText
                    {
                        if scene?.travel() == 1
                        {
                            let newCabinScene = CabinScene(fileNamed: "GameScene")!
                            cabinScene = newCabinScene
                            
                            skView.presentScene(cabinScene, transition: SKTransition.fadeWithDuration(1))
                            scene.scaleMode = .AspectFill
                            newCabinScene.player.xScale = -1
                            
                            text = "Entered the cabin \n" + console.text
                            sceneNum = 1
                        }
                        else if scene?.moveUp() != false
                        {
                            text = "Move up" + "\n" + console.text
                        }
                        else
                        {
                            text = "Unable to move" + "\n" + console.text
                        }
                        checkForNewMethod("Move up [Shortcut = mu]")
                    }
                    else if (methods[i] == "Move down" || methods[i] == "MD") && methods[i].lowercaseString == textFieldText
                    {
                        if scene?.moveDown() != false
                        {
                            text = "Move down" + "\n" + console.text
                        }
                        else
                        {
                            text = "Unable to move" + "\n" + console.text
                        }
                    checkForNewMethod("Move down [Shortcut = ml]")
                    }
                    else if (methods[i] == "Move left" || methods[i] == "ML") && methods[i].lowercaseString == textFieldText
                    {
                        if scene?.moveLeft() != false
                        {
                        text = "Move left" + "\n" + console.text
                        }
                        else
                        {
                            text = "Unable to move" + "\n" + console.text
                        }
                        checkForNewMethod("Move left [Shortcut = ml]")
                    }
                    else if (methods[i] == "Move right" || methods[i] == "MR") && methods[i].lowercaseString == textFieldText
                    {
                        if scene?.moveRight() != false
                        {
                            text = "Move right \n" + console.text
                        }
                        else
                        {
                            text = "Unable to move" + "\n" + console.text
                        }
                        checkForNewMethod("Move right [Shortcut = mr]")
                    }
                    else if (methods[i] == "Read") && methods[i].lowercaseString == textFieldText
                    {
                        if scene?.read() != false
                        {
                            text = "The sign says: 'Hi, new player. The longer you play through the game the more methods you will find. All your found methods and commands will be in the command tab. Good luck and try random things occasionally.'  \n" + console.text
                        }
                        else
                        {
                            text = "There is nothing to read \n" + console.text
                        }
                        checkForNewMethod("Read")
                    }
                    else if (methods[i] == "Talk") && methods[i].lowercaseString == textFieldText
                    {
                        text = "Talking to yourself again? \n" + console.text
                        checkForNewMethod("Talk")
                    }
                    else if (methods[i] == "Done Fishing") && methods[i].lowercaseString == textFieldText
                    {
                        if scene.fishing()
                        {
                            if let newScene = HomeScene(fileNamed: "GameScene")
                            {
                                skView.presentScene(newScene, transition: SKTransition.fadeWithDuration(1.5))
                                newScene.player.position = scene.player.position
                                newScene.sceneNode.position = scene.sceneNode.position
                                scene = newScene
                            }
                            text = "Done Fishing...\n" + console.text
                            text = "You have caught " + "\(fishingScene.count)" + " fish! \n" + console.text
                            inventory.append(Item(name: "Fish", amount: fishingScene.count))
                            
                        }
                        else
                        {
                            text = "You aren't fishing...\n" + console.text
                        }
                        checkForNewMethod("Done Fishing")
                    }
                    else if (methods[i] == "Fish") && methods[i].lowercaseString == textFieldText
                    {
                        if scene.fishing()
                        {
                            if let fishingScene = FishingScene(fileNamed: "GameScene")
                            {
                                skView.presentScene(fishingScene, transition: SKTransition.fadeWithDuration(1.5))
                                self.fishingScene = fishingScene
                            }
                            text = "Fishing...\n" + console.text
                        }
                        else
                        {
                            text = "You cannot fish here...\n" + console.text
                        }
                        checkForNewMethod("Fish")
                    }
                    
                }
                    
                else if sceneNum == 1
                {
                    if (methods[i] == "Move up" || methods[i] == "MU") && methods[i].lowercaseString == textFieldText
                    {
                        
                        if cabinScene.moveUp() != false
                        {
                            text = "Move up" + "\n" + console.text
                        }
                        else
                        {
                            text = "Unable to move" + "\n" + console.text
                        }
                        checkForNewMethod("Move up [Shortcut = mu]")
                    }
                    else if (methods[i] == "Move down" || methods[i] == "MD") && methods[i].lowercaseString == textFieldText
                    {
                        if cabinScene?.travel() == 0
                        {
                            
                            let newHomeScene = HomeScene(fileNamed: "GameScene")!
                            skView.presentScene(newHomeScene, transition: SKTransition.fadeWithDuration(1))
                            newHomeScene.player.position = CGPoint(x: 120, y: 404)
                            newHomeScene.sceneNode.position = CGPoint(x: 360, y: 244)
                            scene = newHomeScene
                            
                            text = "Returned to your home \n" + console.text
                            sceneNum = 0
                            
                        }
                        else if cabinScene?.moveDown() != false
                        {
                            text = "Move down" + "\n" + console.text
                        }
                        else
                        {
                            text = "Unable to move" + "\n" + console.text
                        }
                        checkForNewMethod("Move down [Shortcut = ml]")
                    }
                    else if (methods[i] == "Move left" || methods[i] == "ML") && methods[i].lowercaseString == textFieldText
                    {
                        if cabinScene?.moveLeft() != false
                        {
                            text = "Move left" + "\n" + console.text
                        }
                        else
                        {
                            text = "Unable to move" + "\n" + console.text
                        }
                        checkForNewMethod("Move left [Shortcut = ml]")
                    }
                    else if (methods[i] == "Move right" || methods[i] == "MR") && methods[i].lowercaseString == textFieldText
                    {
                        if cabinScene?.moveRight() != false
                        {
                            text = "Move right \n" + console.text
                        }
                        else
                        {
                            text = "Unable to move" + "\n" + console.text
                        }
                        checkForNewMethod("Move right [Shortcut = mr]")
                    }
                    else if (methods[i] == "Talk") && methods[i].lowercaseString == textFieldText
                    {
                        var completed = false
                        var index = -1
                        var missionIndex = -1
                        for var i = 0; i < inventory.count; i++
                        {
                            if inventory[i].name.lowercaseString == "fish" && inventory[i].amount >= 3
                            {
                                completed = true
                                index = i
                            }
                        }
                        
                        for var i = 0; i < missions.count; i++
                        {
                            if missions[i] == "Collect 3 fish"
                            {
                                missionIndex = i
                            }
                        }
                        
                        if cabinScene?.talk() != false && completed && missions.contains("Collect 3 fish")
                        {
                            text = "The strange old man takes your fish and thanks you \n \nREWARD UPPER AREA UNLOCKED \n\n" + console.text
                            inventory[index].amount -= 3
                            if inventory[index].amount == 0
                            {
                                inventory.removeAtIndex(index)
                            }
                            missions.removeAtIndex(missionIndex)
                            
                        }
                        else if cabinScene?.talk() != false && !missions.contains("Collect 3 fish")
                        {
                            
                            text = "The strange old man says: 'Go fetch me some fish and I will reward you' \n \n (You have a new mission, check your missions tab!) \n \n" + console.text
                            
                            missions.append("Collect 3 fish")
                        }
                        else if cabinScene?.talk() != false
                        {
                            text = "May you please get me some fish, check your missions tab if you need more help \n \n" + console.text
                        }
                        else
                        {
                            text = "Talking to yourself is weird \n" + console.text
                        }
                        
                        checkForNewMethod("Talk")
                    }

                }
                
            }
            
            textField.text = ""
        }
        else
        {
            text = "Unknown command" + "\n" + console.text
            textField.text = ""
        }
        console.text = text
        
        return true
    }
    
    
    func checkPassed(str: String) -> String
    {
        for method in methods
        {
            if str.lowercaseString.rangeOfString(method.lowercaseString) != nil
            {
                return method
            }
        }
        return ""
    }
    
    func check(str: String) -> Bool
    {
        for method in methods
            {
                if str.lowercaseString.rangeOfString(method.lowercaseString) != nil
                {
                    return true
                }
            }
        return false
    }
    
    func checkForNewMethod(str: String)
    {
        for var i = 0; i < knownMethods.count; ++i
        {
            if knownMethods[i] == str
            {
                return
            }
        }
        knownMethods.append(str)
    }
    
    @IBAction func showDoneButton(sender: AnyObject)
    {
        doneButton.hidden = false
    }
    
    @IBAction func closeKeyboard(sender: AnyObject)
    {
        command.resignFirstResponder()
        doneButton.hidden = true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "CommandsSegue"
        {
            let destinationVC = segue.destinationViewController as? CommandsTable
            destinationVC?.knownMethods = self.knownMethods
        }
        if segue.identifier == "MissionsSegue"
        {
            let destinationVC = segue.destinationViewController as? Missions
            destinationVC?.Missions = self.missions
        }
        if segue.identifier == "InventorySegue"
        {
            let destinationVC = segue.destinationViewController as? Inventory
            destinationVC?.inventory = self.inventory
        }
    }
    
}
