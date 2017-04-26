//
//  Animals.swift
//  Animal Escape
//
//  Created by Andrew James Kinsey on 4/24/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import UIKit
import SpriteKit

class Animals: NSObject
{
    var animalNode = SKSpriteNode()
    var image = SKTexture(imageNamed: "")
    var xPosition = Double()
    var yPosition = Double()
    var width = Double()
    var height = Double()
    
    
    init(Texture: SKTexture, xCoordinate: Double, yCoordinate: Double, Width: Double, Height: Double)
    {
       
        image = Texture
        xPosition = xCoordinate
        yPosition = yCoordinate
        width = Width
        height = Height
    }
    
    override init()
    {
        image = SKTexture(imageNamed: "Biker")
        xPosition = 0
        yPosition = 0
        width = 10
        height = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
}
