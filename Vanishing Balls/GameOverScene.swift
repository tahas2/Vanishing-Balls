    //
    //  GameOverScene.swift
    //  Vanishing Balls
    //
    //  Created by Taha Syed on 6/25/16.
    //  Copyright © 2016 Taha. All rights reserved.
    //
    
    import Foundation
    import SpriteKit
    
    class GameOverScene: SKScene{
        
        override func didMove(to view: SKView) {
            
            let background = SKSpriteNode (imageNamed: "background")
            background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            background.zPosition = 0
            self.addChild(background)
            
            let gameOverLabel = SKLabelNode(fontNamed: "Varsity")
            gameOverLabel.text = "GAME OVER"
            gameOverLabel.fontSize = 190
            gameOverLabel.fontColor = SKColor.white
            gameOverLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
            gameOverLabel.zPosition = 1
            self.addChild(gameOverLabel)
            
            let scoreLabel = SKLabelNode(fontNamed: "Varsity")
            scoreLabel.text = "SCORE: \(scoreNumber)"
            scoreLabel.fontSize = 120
            scoreLabel.fontColor = SKColor.white
            scoreLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.55)
            scoreLabel.zPosition = 1
            self.addChild(scoreLabel)
            
            let defaults = UserDefaults()
            var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
            
            if scoreNumber > highScoreNumber{
                highScoreNumber = scoreNumber
                defaults.set(highScoreNumber, forKey: "highScoreSaved")
            }
            
            let highScoreLabel = SKLabelNode(fontNamed: "Varsity")
            highScoreLabel.text = "HIGH SCORE: \(highScoreNumber)"
            highScoreLabel.fontSize = 120
            highScoreLabel.fontColor = SKColor.white
            highScoreLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.48)
            highScoreLabel.zPosition = 1
            self.addChild(highScoreLabel)
            
            
            let restartLabel = SKLabelNode(fontNamed: "Varsity")
            restartLabel.text = "RESTART"
            restartLabel.fontSize = 120
            restartLabel.fontColor = SKColor.white
            restartLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.25)
            restartLabel.zPosition = 1
            restartLabel.name = "restart"
            self.addChild(restartLabel)
            
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
            for touch: AnyObject in touches{
                
                let pointOfTouch = touch.location(in: self)
                let tappedNode = atPoint(pointOfTouch)
                let tappedNodeName = tappedNode.name
                
                if tappedNodeName == "restart"{
                    
                    let scenteToMoveTo = GameScene(size: self.size)
                    scenteToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(scenteToMoveTo, transition: myTransition)
                    
                }
                
            }
            
        }
        
        
        
        
        
        
        
    }

      
      
