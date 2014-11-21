//
//  ViewController.swift
//  sound_data
//
//  Created by Student on 11/21/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController {

    @IBAction func oneBtn(sender: AnyObject) {
        coreAudio()
        audio1.play()
    }
    
    @IBAction func twoBtn(sender: AnyObject) {
        coreAudio()
        audio2.play()
    }
    @IBAction func threeBtn(sender: AnyObject) {
        coreAudio()
        audio3.play()
    }
    
    @IBAction func stop(sender: AnyObject) {
        audio1.stop()
        audio2.stop()
        audio3.stop()
    }
    // Core Audio
    var audio1 = AVAudioPlayer()
    var audio2 = AVAudioPlayer()
    var audio3 = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
    }
    // MARK core Audio
    func coreAudio(){
        
        var url1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("kick", ofType: "mp3")!)
        var url2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("hihat", ofType: "mp3")!)
        var url3 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("snare", ofType: "mp3")!)
        var error: NSError?
        var timer1 = NSTimer(timeInterval: 0.01, target: audio1, selector:"update", userInfo: nil, repeats: true);
        
        audio1 = AVAudioPlayer(contentsOfURL: url1, error: &error)
        audio1.prepareToPlay()
        
        audio2 = AVAudioPlayer(contentsOfURL: url2, error: &error)
        audio2.prepareToPlay()
        
        audio3 = AVAudioPlayer(contentsOfURL: url3, error: &error)
        audio3.prepareToPlay()
        
        
    }
}

