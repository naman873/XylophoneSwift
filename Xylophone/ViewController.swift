//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @discardableResult func playSound(named soundName: String) -> AVAudioPlayer {
        
        let audioPath = Bundle.main.path(forResource: soundName, ofType: "wav")
        player = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    
        player.play()
        
        return player
    }
    
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var color = sender.backgroundColor;
        print(sender.currentTitle!);
        playSound(named: sender.currentTitle!)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200), execute: {
            sender.alpha = 1
        })
        
    }
    
}
