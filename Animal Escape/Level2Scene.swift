//
//  Level1Scene.swift
//  Animal Escape
//
//  Created by Andrew James Kinsey on 4/19/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import Foundation
import SpriteKit

class Level2Scene: SKScene, SKPhysicsContactDelegate
{
    
    var wall: SKSpriteNode!
    var winZone: SKSpriteNode!
    var backButton: SKSpriteNode!
    var resetButton: SKSpriteNode!
    var jeepNode: SKSpriteNode!
    var winNotificationNode: SKLabelNode!
    var nextLevelNode: SKSpriteNode!
    var timerNode: SKLabelNode!
    
    var giraffeNode: SKSpriteNode!
    var zebraNode: SKSpriteNode!
    var tigerNode: SKSpriteNode!
    var cheetahNode: SKSpriteNode!
    var eagleNode: SKSpriteNode!
    var snakeNode: SKSpriteNode!
    
    var time = 15
    
    override func didMove(to view: SKView)
    {
        backgroundColor = UIColor.black
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        createGame()
    }
    
    
    
    
    //
    //  movement and contact
    //
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first
        
        if backButton.contains((touch?.location(in: self))!)
        {
            let newScene = LevelSelectScene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.fade(withDuration: 1)
            self.view?.presentScene(newScene, transition: reveal)
        }
        if resetButton.contains((touch?.location(in: self))!)
        {
            resetGame()
        }
        if nextLevelNode.contains((touch?.location(in: self))!)
        {
            let newScene = Level2Scene(size: self.size)
            newScene.scaleMode = scaleMode
            let reveal = SKTransition.flipVertical(withDuration: 2)
            self.view?.presentScene(newScene, transition: reveal)
        }
        
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first
        
        
        if jeepNode.contains((touch?.location(in: self))!)
        {
            let location = touch?.location(in: self)
            jeepNode.position.x = (location?.x)!
        }
        if giraffeNode.contains((touch?.location(in: self))!)
        {
            let location = touch?.location(in: self)
            giraffeNode.position.y = (location?.y)!
        }
        if zebraNode.contains((touch?.location(in: self))!)
        {
            let location = touch?.location(in: self)
            zebraNode.position.x = (location?.x)!
        }
        if tigerNode.contains((touch?.location(in: self))!)
        {
            let location = touch?.location(in: self)
            tigerNode.position.x = (location?.x)!
        }
        if cheetahNode.contains((touch?.location(in: self))!)
        {
            let location = touch?.location(in: self)
            cheetahNode.position.x = (location?.x)!
        }
        if eagleNode.contains((touch?.location(in: self))!)
        {
            let location = touch?.location(in: self)
            eagleNode.position.y = (location?.y)!
        }
        if snakeNode.contains((touch?.location(in: self))!)
        {
            let location = touch?.location(in: self)
            snakeNode.position.x = (location?.x)!
        }
    }
    
    
    // Contact
    
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        if contact.bodyA.node?.name == "winZone" && contact.bodyB.node?.name == "jeep" || contact.bodyA.node?.name == "jeep" && contact.bodyB.node?.name == "winZone"
        {
            jeepNode.physicsBody?.isDynamic = false
            print("win")
            displayWinNode()
            jeepNode.removeAllActions()
        }
        else
        {
            resetGame()
        }
    }
    
    //
    //    end game and reset
    //
    
    func displayWinNode()
    {
        winNotificationNode = SKLabelNode(text: "You Won")
        winNotificationNode.fontColor = UIColor.red
        winNotificationNode.fontSize = 100
        winNotificationNode.position = CGPoint(x: frame.midX, y: frame.midY)
        winNotificationNode.zPosition = 30
        
        addChild(winNotificationNode)
    }
    
    func resetGame()
    {
        time = 15
        removeAllChildren()
        createGame()
    }
    
    
    
    
    //
    //    ˘Functions to set up level˘
    //
    
    
    func createGame()
    {
        makeWalls()
        makeBackButton()
        makeNextLevelButton()
        makeResetButton()
        makeJeep()
        makeTimer(time: "\(time)")
        startTimer()
        makeGiraffe(xPosition: 500, yPosition: 760)
        makeZebra(xPosition: 550, yPosition: 450)
        makeTiger(xPosition: 500, yPosition: 950)
        makeCheetah(xPosition: 360, yPosition: 450)
        makeEagle(xPosition: 200, yPosition: 450)
        makeSnake(xPosition: 250, yPosition: 950)
    }
    
    
    
    
    func makeTimer(time: String)
    {
        timerNode = SKLabelNode(text: time)
        timerNode.position = CGPoint(x: frame.midX, y: frame.maxY - 130)
        timerNode.fontSize = 100
        timerNode.color = UIColor.white
        timerNode.fontColor = UIColor.white
        timerNode.zPosition = 5
        
        addChild(timerNode)
    }
    
    
    func startTimer()
    {
        
        let wait = SKAction.wait(forDuration: 1.0)
        let run = SKAction.run
        {
            self.time -= 1
            
            if self.time == 0
            {
                self.resetGame()
            }
            else
            {
                self.timerNode.removeFromParent()
                self.makeTimer(time: "\(self.time)")
            }
        }
        let sequence = SKAction.sequence([wait , run])
        let moveForever = SKAction.repeatForever(sequence)
        jeepNode.run(moveForever)
        
    }
    
    
    
    func makeWalls()
    {
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
        winZone = SKSpriteNode(color: UIColor.red, size: CGSize(width: 47, height: 100))
        winZone.position = CGPoint(x: frame.maxX - 70, y: 750)
        winZone.zPosition = 3
        winZone.name = "winZone"
        winZone.physicsBody = SKPhysicsBody(rectangleOf: winZone.size)
        winZone.physicsBody?.isDynamic = false
        winZone.physicsBody?.affectedByGravity = false
        
        addChild(winZone)
    }
    
    func makeBackButton()
    {
        backButton = SKSpriteNode(texture: SKTexture(imageNamed: "backArrow"))
        backButton.size = CGSize(width: 125, height: 125)
        backButton.position = CGPoint(x: frame.midX / 2, y: frame.minY + 125)
        backButton.zPosition = 5
        backButton.name = "backButton"
        
        addChild(backButton)
    }
    
    func makeNextLevelButton()
    {
        nextLevelNode = SKSpriteNode(texture: SKTexture(imageNamed: "nextLevelButton"))
        nextLevelNode.size = CGSize(width: 125, height: 125)
        nextLevelNode.position = CGPoint(x: frame.width / 4 * 3 , y: frame.minY + 125)
        nextLevelNode.zPosition = 5
        nextLevelNode.name = "nextLevelButton"
        
        addChild(nextLevelNode)
    }
    
    func makeResetButton()
    {
        resetButton = SKSpriteNode(texture: SKTexture(imageNamed: "Reset"))
        resetButton.size = CGSize(width: 150, height: 150)
        resetButton.position = CGPoint(x: frame.midX , y: frame.minY + 125)
        resetButton.zPosition = 5
        resetButton.name = "resetButton"
        
        addChild(resetButton)
    }
    
    func makeJeep()
    {
        jeepNode = SKSpriteNode(texture: SKTexture(imageNamed: "Jeep"))
        jeepNode.size = CGSize(width: 150, height: 75)
        jeepNode.position = CGPoint(x: 200, y: 760)
        jeepNode.zPosition = 5
        jeepNode.name = "jeep"
        
        jeepNode.physicsBody = SKPhysicsBody(rectangleOf: jeepNode.size)
        jeepNode.physicsBody?.isDynamic = true
        jeepNode.physicsBody?.affectedByGravity = false
        jeepNode.physicsBody?.usesPreciseCollisionDetection = true
        jeepNode.physicsBody?.allowsRotation = false
        jeepNode.physicsBody?.collisionBitMask = 1
        jeepNode.physicsBody?.contactTestBitMask = (jeepNode.physicsBody?.collisionBitMask)!
        
        
        
        addChild(jeepNode)
    }
    
    //
    // Functions to make animals
    // 1 = 75
    //Giraffe 1x3
    //Zebra 2x1
    //Tiger 2x1
    // Cheetah  2x1
    // Eagle 1x2
    // Snake 3x1
    //
    
    
    func makeGiraffe(xPosition: Double, yPosition: Double)
    {
        giraffeNode = SKSpriteNode(texture: SKTexture(imageNamed: "Giraffe"))
        giraffeNode.size = CGSize(width: 75, height: 225)
        giraffeNode.position = CGPoint(x: xPosition, y: yPosition)
        giraffeNode.zPosition = 5
        giraffeNode.name = "Giraffe"
        giraffeNode.physicsBody = SKPhysicsBody(rectangleOf: giraffeNode.size)
        giraffeNode.physicsBody?.isDynamic = true
        giraffeNode.physicsBody?.affectedByGravity = false
        giraffeNode.physicsBody?.usesPreciseCollisionDetection = true
        giraffeNode.physicsBody?.allowsRotation = false
        giraffeNode.physicsBody?.collisionBitMask = 1
        giraffeNode.physicsBody?.contactTestBitMask = (giraffeNode.physicsBody?.collisionBitMask)!
        
        
        addChild(giraffeNode)
    }
    
    func makeZebra(xPosition: Double, yPosition: Double)
    {
        zebraNode = SKSpriteNode(texture: SKTexture(imageNamed: "Zebra"))
        zebraNode.size = CGSize(width: 150, height: 75)
        zebraNode.position = CGPoint(x: xPosition, y: yPosition)
        zebraNode.zPosition = 5
        zebraNode.name = "Zebra"
        zebraNode.physicsBody = SKPhysicsBody(rectangleOf: zebraNode.size)
        zebraNode.physicsBody?.isDynamic = true
        zebraNode.physicsBody?.affectedByGravity = false
        zebraNode.physicsBody?.usesPreciseCollisionDetection = true
        zebraNode.physicsBody?.allowsRotation = false
        zebraNode.physicsBody?.collisionBitMask = 1
        zebraNode.physicsBody?.contactTestBitMask = (zebraNode.physicsBody?.collisionBitMask)!
        
        
        addChild(zebraNode)
    }
    
    func makeTiger(xPosition: Double, yPosition: Double)
    {
        tigerNode = SKSpriteNode(texture: SKTexture(imageNamed: "Tiger"))
        tigerNode.size = CGSize(width: 150, height: 75)
        tigerNode.position = CGPoint(x: xPosition, y: yPosition)
        tigerNode.zPosition = 5
        tigerNode.name = "Zebra"
        tigerNode.physicsBody = SKPhysicsBody(rectangleOf: tigerNode.size)
        tigerNode.physicsBody?.isDynamic = true
        tigerNode.physicsBody?.affectedByGravity = false
        tigerNode.physicsBody?.usesPreciseCollisionDetection = true
        tigerNode.physicsBody?.allowsRotation = false
        tigerNode.physicsBody?.collisionBitMask = 1
        tigerNode.physicsBody?.contactTestBitMask = (tigerNode.physicsBody?.collisionBitMask)!
        
        
        addChild(tigerNode)
    }
    
    func makeCheetah(xPosition: Double, yPosition: Double)
    {
        cheetahNode = SKSpriteNode(texture: SKTexture(imageNamed: "Cheetah"))
        cheetahNode.size = CGSize(width: 150, height: 75)
        cheetahNode.position = CGPoint(x: xPosition, y: yPosition)
        cheetahNode.zPosition = 5
        cheetahNode.name = "Cheetah"
        cheetahNode.physicsBody = SKPhysicsBody(rectangleOf: cheetahNode.size)
        cheetahNode.physicsBody?.isDynamic = true
        cheetahNode.physicsBody?.affectedByGravity = false
        cheetahNode.physicsBody?.usesPreciseCollisionDetection = true
        cheetahNode.physicsBody?.allowsRotation = false
        cheetahNode.physicsBody?.collisionBitMask = 1
        cheetahNode.physicsBody?.contactTestBitMask = (cheetahNode.physicsBody?.collisionBitMask)!
        
        
        addChild(cheetahNode)
    }
    
    func makeEagle(xPosition: Double, yPosition: Double)
    {
        eagleNode = SKSpriteNode(texture: SKTexture(imageNamed: "Eagle"))
        eagleNode.size = CGSize(width: 75, height: 150)
        eagleNode.position = CGPoint(x: xPosition, y: yPosition)
        eagleNode.zPosition = 5
        eagleNode.name = "Eagle"
        eagleNode.physicsBody = SKPhysicsBody(rectangleOf: eagleNode.size)
        eagleNode.physicsBody?.isDynamic = true
        eagleNode.physicsBody?.affectedByGravity = false
        eagleNode.physicsBody?.usesPreciseCollisionDetection = true
        eagleNode.physicsBody?.allowsRotation = false
        eagleNode.physicsBody?.collisionBitMask = 1
        eagleNode.physicsBody?.contactTestBitMask = (eagleNode.physicsBody?.collisionBitMask)!
        
        
        addChild(eagleNode)
    }
    
    func makeSnake(xPosition: Double, yPosition: Double)
    {
        snakeNode = SKSpriteNode(texture: SKTexture(imageNamed: "Snake"))
        snakeNode.size = CGSize(width: 225, height: 75)
        snakeNode.position = CGPoint(x: xPosition, y: yPosition)
        snakeNode.zPosition = 5
        snakeNode.name = "Snake"
        snakeNode.physicsBody = SKPhysicsBody(rectangleOf: snakeNode.size)
        snakeNode.physicsBody?.isDynamic = true
        snakeNode.physicsBody?.affectedByGravity = false
        snakeNode.physicsBody?.usesPreciseCollisionDetection = true
        snakeNode.physicsBody?.allowsRotation = false
        snakeNode.physicsBody?.collisionBitMask = 1
        snakeNode.physicsBody?.contactTestBitMask = (snakeNode.physicsBody?.collisionBitMask)!
        
        
        addChild(snakeNode)
    }
    
    
    
    
    
}
