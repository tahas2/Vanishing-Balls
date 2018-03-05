//
//  GameScene.swift
//  Vanishing Balls
//
//  Created by Taha Syed on 6/23/16.
//  Copyright (c) 2016 Taha. All rights reserved.
//

import SpriteKit
    var scoreNumber = 0

class GameScene: SKScene {
    
    let scoreLabel = SKLabelNode(fontNamed: "Varsity")
    
    let playGameOver = SKAction.playSoundFileNamed("Ref.wav", waitForCompletion: false)
    
    var gameArea = CGRect()
    
    override init(size: CGSize) {
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let gameAreaMargin = (size.width - playableWidth)/2
        gameArea = CGRect(x: gameAreaMargin, y: 0, width: playableWidth, height: size.height)
        
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
        
    

    override func didMove(to view: SKView) {
        
        scoreNumber = 0
        
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let ball = SKSpriteNode(imageNamed: "ball1")
        ball.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        ball.zPosition = 2
        ball.name = "ballObject"
        self.addChild(ball)
        
        scoreLabel.fontSize = 250
        scoreLabel.text = "0"
        scoreLabel.fontColor = SKColor.white
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        self.addChild(scoreLabel)
        
    }
    
    
    
    func spawnNewBall(){
        
        
        var randomImageNumber = arc4random()%7
        randomImageNumber += 1
        
        let ball = SKSpriteNode (imageNamed: "ball\(randomImageNumber)")
        ball.zPosition = 2
        ball.name = "ballObject"
        
        let randomX = random(min: gameArea.minX + ball.size.width/2,
                                    max: gameArea.maxX - ball.size.width/2)
        
        let randomY = random(min: gameArea.minY + ball.size.width/2,
                             max: gameArea.maxY - ball.size.width/2)
        
        ball.position = CGPoint(x: randomX, y: randomY)
        self.addChild(ball)
        
        ball.run(SKAction.sequence([SKAction.scale(to: 0, duration: 3), playGameOver, SKAction.run(runGameOver)]))
        
    }
    
    
    
    
    func runGameOver() {
        
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.fade(withDuration: 0.2)
        self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
        
    }
        
    
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if nameOfTappedNode == "ballObject"{
                
                
                tappedNode.name = ""
                
                tappedNode.removeAllActions()
                
                
                tappedNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.1), SKAction.removeFromParent()]))
                
                
                
                spawnNewBall()
                
                scoreNumber += 1
                scoreLabel.text = "\(scoreNumber)"
                
                
                if scoreNumber == 10 || scoreNumber == 50 || scoreNumber == 100 || scoreNumber == 200 || scoreNumber == 300 || scoreNumber == 50{
                    spawnNewBall()
                }
                
                }
                
                    
                }
                
            }
            
            
        }
        
        
    
