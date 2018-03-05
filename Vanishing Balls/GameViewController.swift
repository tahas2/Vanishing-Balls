//
//  GameViewController.swift
//  Vanishing Balls
//
//  Created by Taha Syed on 6/23/16.
//  Copyright (c) 2016 Taha. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class GameViewController: UIViewController {
    
    var song2 = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
                
                let filePath = Bundle.main.path(forResource: "song2", ofType: "mp3")
                let audioNSURL = URL(fileURLWithPath: filePath!)
                
                do { song2 = try AVAudioPlayer(contentsOf: audioNSURL) }
                catch { return print("Can't find audio") }
                
                song2.numberOfLoops = -1
                song2.volume = 0.25
                song2.play()
        
        
        
        
        let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            
            skView.presentScene(scene)
        
    }

    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
