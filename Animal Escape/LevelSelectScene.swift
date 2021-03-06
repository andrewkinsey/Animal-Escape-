//
//  LevelSelectScene.swift
//  Animal Escape
//
//  Created by Andrew James Kinsey on 4/17/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import Foundation
import SpriteKit

class LevelSelectScene: SKScene
{
    var levelNode1: SKSpriteNode!
    var levelNode2: SKSpriteNode!
    var levelNode3: SKSpriteNode!
    var levelNode4: SKSpriteNode!
    var levelNode5: SKSpriteNode!
    var levelNode6: SKSpriteNode!
    var levelNode7: SKSpriteNode!
    var levelSelectNode: SKLabelNode!


    override func didMove(to view: SKView)
    {
        backgroundColor = UIColor.white
        makeLevelNodes()
    }

    func makeLevelNodes()
    {
        makeLevelSelectNode()
        
        makeLevelNode1(yPoint: Float(frame.maxY - 200))
        makeLevelNode2(yPoint: Float(frame.maxY - 370))
        makeLevelNode3(yPoint: Float(frame.maxY - 540))
        makeLevelNode4(yPoint: Float(frame.maxY - 710))
        makeLevelNode5(yPoint: Float(frame.maxY - 880))
        makeLevelNode6(yPoint: Float(frame.maxY - 1050))
        makeLevelNode7(yPoint: Float(frame.maxY - 1220))
    }
    
    
    func makeLevelSelectNode()
    {
        levelSelectNode = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        levelSelectNode.text = "Select a Level"
        levelSelectNode.position = CGPoint(x: frame.width / 2, y: frame.maxY - 100)
        levelSelectNode.fontSize = 70
        levelSelectNode.fontColor = UIColor.black
        
        addChild(levelSelectNode)
    }
    
    func makeLevelNode1(yPoint: Float)
    {
        levelNode1 = SKSpriteNode(texture: SKTexture(imageNamed: "1"))
        levelNode1.size =  CGSize(width: 150, height: 150)
        levelNode1.position = CGPoint(x: frame.midX, y: CGFloat(yPoint))
        levelNode1.zPosition = 1
        levelNode1.name = "1"
        addChild(levelNode1)
    }
    
    func makeLevelNode2(yPoint: Float)
    {
        levelNode2 = SKSpriteNode(texture: SKTexture(imageNamed: "2"))
        levelNode2.size =  CGSize(width: 150, height: 150)
        levelNode2.position = CGPoint(x: frame.midX, y: CGFloat(yPoint))
        levelNode2.zPosition = 2
        levelNode2.name = "2"
        addChild(levelNode2)
    }
    
    func makeLevelNode3(yPoint: Float)
    {
        levelNode3 = SKSpriteNode(texture: SKTexture(imageNamed: "3"))
        levelNode3.size =  CGSize(width: 150, height: 150)
        levelNode3.position = CGPoint(x: frame.midX, y: CGFloat(yPoint))
        levelNode3.zPosition = 3
        levelNode3.name = "3"
        addChild(levelNode3)
    }
    
    func makeLevelNode4(yPoint: Float)
    {
        levelNode4 = SKSpriteNode(texture: SKTexture(imageNamed: "4"))
        levelNode4.size =  CGSize(width: 150, height: 150)
        levelNode4.position = CGPoint(x: frame.midX, y: CGFloat(yPoint))
        levelNode4.zPosition = 4
        levelNode4.name = "4"
        addChild(levelNode4)
    }
    
    func makeLevelNode5(yPoint: Float)
    {
        levelNode5 = SKSpriteNode(texture: SKTexture(imageNamed: "5"))
        levelNode5.size =  CGSize(width: 150, height: 150)
        levelNode5.position = CGPoint(x: frame.midX, y: CGFloat(yPoint))
        levelNode5.zPosition = 5
        levelNode5.name = "5"
        addChild(levelNode5)
    }
    
    func makeLevelNode6(yPoint: Float)
    {
        levelNode6 = SKSpriteNode(texture: SKTexture(imageNamed: "6"))
        levelNode6.size =  CGSize(width: 150, height: 150)
        levelNode6.position = CGPoint(x: frame.midX, y: CGFloat(yPoint))
        levelNode6.zPosition = 6
        levelNode6.name = "6"
        addChild(levelNode6)
    }
    
    func makeLevelNode7(yPoint: Float)
    {
        levelNode7 = SKSpriteNode(texture: SKTexture(imageNamed: "7"))
        levelNode7.size =  CGSize(width: 150, height: 150)
        levelNode7.position = CGPoint(x: frame.midX, y: CGFloat(yPoint))
        levelNode7.zPosition = 7
        levelNode7.name = "7"
        addChild(levelNode7)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //find first level node
        let touch = touches.first
        if levelNode1.contains((touch?.location(in: self))!)
        {
            let newScene = Level1Scene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
            self.view?.presentScene(newScene, transition: reveal)
        }
        if levelNode2.contains((touch?.location(in: self))!)
        {
            let newScene = Level2Scene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
            self.view?.presentScene(newScene, transition: reveal)
        }
        if levelNode3.contains((touch?.location(in: self))!)
        {
            let newScene = Level3Scene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
            self.view?.presentScene(newScene, transition: reveal)
        }
        if levelNode4.contains((touch?.location(in: self))!)
        {
            let newScene = Level4Scene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
            self.view?.presentScene(newScene, transition: reveal)
        }
        if levelNode5.contains((touch?.location(in: self))!)
        {
            let newScene = Level5Scene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
            self.view?.presentScene(newScene, transition: reveal)
        }
        if levelNode6.contains((touch?.location(in: self))!)
        {
            let newScene = Level6Scene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
            self.view?.presentScene(newScene, transition: reveal)
        }
        if levelNode7.contains((touch?.location(in: self))!)
        {
            let newScene = Level7Scene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
            self.view?.presentScene(newScene, transition: reveal)
        }
        
    }
    
    
    
    
}
