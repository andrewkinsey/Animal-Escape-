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
    var animalNode: SKSpriteNode!
    var bikerNode: SKSpriteNode!
    
    override func didMove(to view: SKView)
    {
        backgroundColor = UIColor.black
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        createGame()
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
    
    func makeAnimal(animalHeight: Double, animalWidth: Double, xPosition: Double, yPosition: Double, animalName: String, animalTexture: SKTexture, horizontalMovement: Bool)
    {
        animalNode = SKSpriteNode(texture: animalTexture)
        animalNode.size = CGSize(width: animalWidth, height: animalHeight)
        animalNode.position = CGPoint(x: xPosition, y: yPosition)
        animalNode.zPosition = 5
        animalNode.name = animalName
        animalNode.physicsBody = SKPhysicsBody(rectangleOf: animalNode.size)
        animalNode.physicsBody?.isDynamic = false
        
        
        addChild(animalNode)
    }
    
    func makeBiker()
    {
        bikerNode = SKSpriteNode(texture: SKTexture(imageNamed: "Biker"))
        bikerNode.size = CGSize(width: 130, height: 125)
        bikerNode.position = CGPoint(x: 150, y: 760)
        bikerNode.zPosition = 5
        bikerNode.name = "biker"
        bikerNode.physicsBody = SKPhysicsBody(rectangleOf: bikerNode.size)
        bikerNode.physicsBody?.isDynamic = false
        
        
        addChild(bikerNode)
    }
    
    func createGame()
    {
        makeWall(wallHeight: 800, wallWidth: 40, xPosition: 70, yPosition: 650)
        makeWall(wallHeight: 40, wallWidth: Double(frame.width - 100), xPosition: Double(frame.width / 2), yPosition: 250)
        makeWall(wallHeight: 40, wallWidth: Double(frame.width - 100), xPosition: Double(frame.width / 2), yPosition: 1050)
        makeWall(wallHeight: 800, wallWidth: 40, xPosition: Double(frame.maxX - 70), yPosition: 650)
        makeWinZone()
        makeBiker()
        //make animals
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first
        if bikerNode.contains((touch?.location(in: self))!)
        {
            for touch in touches
            {
                let location = touch.location(in: self)
                bikerNode.position.x = location.x
            }
        }
    }
    
    
    
    
}
