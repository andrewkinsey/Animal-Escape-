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
    var levelNode: SKSpriteNode!

    override func didMove(to view: SKView)
    {
        backgroundColor = UIColor.black
        makeLevelNodes()
    }

    func makeLevelNodes()
    {
        makeLevelNode(yPoint: Float(frame.maxY - 100), levelNumber: 1)
        makeLevelNode(yPoint: Float(frame.maxY - 260), levelNumber: 2)
        makeLevelNode(yPoint: Float(frame.maxY - 420), levelNumber: 3)
        makeLevelNode(yPoint: Float(frame.maxY - 580), levelNumber: 4)
        makeLevelNode(yPoint: Float(frame.maxY - 740), levelNumber: 5)
        makeLevelNode(yPoint: Float(frame.maxY - 900), levelNumber: 6)
        makeLevelNode(yPoint: Float(frame.maxY - 1060), levelNumber: 7)
    }
    
    func makeLevelNode(yPoint: Float, levelNumber: Int)
    {
        levelNode = SKSpriteNode(color: UIColor.yellow, size: (CGSize(width: 150, height: 150)))
        levelNode.position = CGPoint(x: frame.midX, y: CGFloat(yPoint))
        levelNode.zPosition = 1
        levelNode.name = "\(levelNumber)"
        addChild(levelNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //find first level node
        let touch = touches.first
        if levelNode.contains((touch?.location(in: self))!) && levelNode.name == "1"
        {
            
            
            let newScene = Level1Scene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.doorway(withDuration: 1)
            self.view?.presentScene(newScene, transition: reveal)
            
        }
        
    }
    
    
    
    
}
