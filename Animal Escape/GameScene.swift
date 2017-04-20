//
//  GameScene.swift
//  Animal Escape
//
//  Created by Andrew James Kinsey on 4/17/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    var titleNode: SKLabelNode!
    var continueLabel: SKLabelNode!
    
    override func didMove(to view: SKView)
    {
        backgroundColor = UIColor.black
        makeTitleScreen()
       
        
    }
 
    
    func makeTitleScreen()
    {
        titleNode = SKLabelNode()
        titleNode.text = "Animal Escape!"
        titleNode.fontColor = UIColor.red
        titleNode.fontSize = 100
        titleNode.zPosition = 1
        titleNode.position = CGPoint(x: 0, y: 35)
        
        
        continueLabel = SKLabelNode(text: "Touch Anywhere to Continue")
        continueLabel.fontSize = 60
        continueLabel.fontColor = UIColor.white
        continueLabel.zPosition = 1
        continueLabel.position = CGPoint(x: 0, y: -40)
        
        addChild(continueLabel)
        addChild(titleNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let newScene = LevelSelectScene(size: self.size)
        newScene.scaleMode = scaleMode
        let reveal = SKTransition.doorway(withDuration: 1)
        self.view?.presentScene(newScene, transition: reveal)
    }
    
    
    
    
    
}
