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
        let levelWidth = (Double)((frame.width / 3) - 50)
        let levelHeight = 175.0
        
        let levelEdge = Double(levelWidth / 2)
        let screenEdge = Double(frame.midX - (frame.width / 2))
        var xPosition = Double(screenEdge + levelEdge + 50)
        var yPosition = 500.0
        var levelNumber = 0
        
        for rows in 1...3
        {
            for columns in 1...3
            {
                makeLevelNode(xPoint: xPosition, yPoint: yPosition, levelWidth: levelWidth, levelHeight: levelHeight, levelNumber: levelNumber)
                
                xPosition += (levelWidth + 25)
                levelNumber += 1
                
            }
            xPosition = screenEdge + levelEdge + 50
            yPosition += (levelHeight + 25)
        }
        
    }
    
    func makeLevelNode(xPoint: Double, yPoint: Double, levelWidth: Double, levelHeight: Double, levelNumber: Int)
    {
        levelNode = SKSpriteNode(color: UIColor.yellow, size: (CGSize(width: levelWidth, height: levelHeight)))
        levelNode.position = CGPoint(x: xPoint, y: yPoint)
        levelNode.zPosition = 1
        levelNode.name = "\(levelNumber)"
        addChild(levelNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //find first level node
        let touch = touches.first
        if levelNode.contains((touch?.location(in: self))!) && levelNode.name == "8"
        {
            
            
            let newScene = Level1Scene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.doorway(withDuration: 1)
            self.view?.presentScene(newScene, transition: reveal)
            
        }
        
    }
    
    
    
    
}
