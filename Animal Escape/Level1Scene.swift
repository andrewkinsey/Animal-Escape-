//
//  Level1Scene.swift
//  Animal Escape
//
//  Created by Andrew James Kinsey on 4/19/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import Foundation
import SpriteKit

class Level1Scene: SKScene, SKPhysicsContactDelegate
{
    
    var wall: SKSpriteNode!
    var winZone: SKSpriteNode!
    
    override func didMove(to view: SKView)
    {
        backgroundColor = UIColor.black
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        makeWall(wallHeight: 800, wallWidth: 40, xPosition: 70, yPosition: 650)
        makeWall(wallHeight: 40, wallWidth: Double(frame.width - 100), xPosition: Double(frame.width / 2), yPosition: 250)
        makeWall(wallHeight: 40, wallWidth: Double(frame.width - 100), xPosition: Double(frame.width / 2), yPosition: 1050)
        makeWall(wallHeight: 800, wallWidth: 40, xPosition: Double(frame.maxX - 70), yPosition: 650)
        makeWinZone()
    }
    
    
    func makeWall(wallHeight: Double, wallWidth: Double, xPosition: Double, yPosition: Double)
    {
        wall = SKSpriteNode(color: UIColor.gray, size: CGSize(width: wallWidth, height: wallHeight))
        wall.position = CGPoint(x: xPosition, y: yPosition)
        wall.name = "wall"
        wall.physicsBody = SKPhysicsBody(rectangleOf: wall.size)
        wall.physicsBody?.isDynamic = false
        wall.zPosition = 1
        
        
        addChild(wall)
    }
    
    func makeWinZone()
    {
        winZone = SKSpriteNode(color: UIColor.red, size: CGSize(width: 41, height: 100))
        winZone.position = CGPoint(x: frame.maxX - 70, y: 750)
        winZone.zPosition = 3
        winZone.name = "winZone"
        winZone.physicsBody = SKPhysicsBody(rectangleOf: winZone.size)
        winZone.physicsBody?.isDynamic = false
        
        addChild(winZone)
    }
    
    
    
    
    
}
