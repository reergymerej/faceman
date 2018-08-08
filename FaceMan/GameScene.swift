//
//  GameScene.swift
//  FaceMan
//
//  Created by Jeremy Greer on 8/7/18.
//  Copyright © 2018 Grizzle. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var headMan = SKSpriteNode()
    private var headManFrames : [SKTexture] = []

    override func didMove(to view: SKView) {
        self.buildMan()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.animateMan()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func buildMan() {
        // Create a texture atlas from items in face.atlas.
        let faceAtlas = SKTextureAtlas(named: "face")
        
        // Add each of the images to the list headManFrames.
        self.headManFrames = [
            faceAtlas.textureNamed("face01.png"),
            faceAtlas.textureNamed("face02.png"),
            faceAtlas.textureNamed("face03.png"),
            faceAtlas.textureNamed("face04.png"),
            faceAtlas.textureNamed("face03.png"),
            faceAtlas.textureNamed("face02.png"),
        ]

        // Create the headMan node.
        self.headMan = SKSpriteNode(texture: self.headManFrames.first)
        self.headMan.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        self.addChild(self.headMan)
    }
    
    func animateMan() {
        let action = SKAction.animate(with: self.headManFrames,
                                      timePerFrame: 0.05,
                                      resize: false,
                                      restore: false
                                      )
        self.headMan.run(action)
    }
}
