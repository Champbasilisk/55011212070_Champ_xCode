//
//  ViewController.swift
//  Quiz
//
//  Created by Student on 11/14/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var BG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func animateButtonBlue(sender: AnyObject) {
        let duration : NSTimeInterval = 3.0
        let options = UIViewAnimationOptions.CurveLinear
        let delay =  NSTimeInterval( ((Int(rand()) %  900)+100.0) / 1000.0)
        
        
        // set up some constants for the fish
        let size : CGFloat = CGFloat( Int(rand()) %  60 + 20.0)
        let yPosition : CGFloat = CGFloat( Int(rand()) %  400 + 20.0)
        
        // create the fish and add it to the screen
        let fish = UIImageView()
        fish.image = UIImage(named: "fish_B.png")
        fish.frame = CGRectMake(0-size, yPosition, size, size)
        self.view.addSubview(fish)
        
        // define the animation
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            
            // move the fish
            fish.frame = CGRectMake(320, yPosition, size, size)
            
            }, completion: { animationFinished in
                
                // remove the fish
                fish.removeFromSuperview()
                
        })

    }
    @IBAction func animateButtonYellow(sender: AnyObject){
        let duration : NSTimeInterval = 3.0
        let options = UIViewAnimationOptions.CurveLinear
        let delay =  NSTimeInterval( ((Int(rand()) %  900)+100.0) / 1000.0)
        
        
        // set up some constants for the fish
        let size : CGFloat = CGFloat( Int(rand()) %  60 + 20.0)
        let yPosition : CGFloat = CGFloat( Int(rand()) %  400 + 20.0)
        
        // create the fish and add it to the screen
        let fish = UIImageView()
        fish.image = UIImage(named: "fish_Y.png")
        fish.frame = CGRectMake(0-size, yPosition, size, size)
        self.view.addSubview(fish)
        
        // define the animation
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            
            // move the fish
            fish.frame = CGRectMake(320, yPosition, size, size)
            
            }, completion: { animationFinished in
                
                // remove the fish
                fish.removeFromSuperview()
                
        })

    }
    
    @IBAction func animateButtonRed(sender: AnyObject) {
            // set up some constants for the animation
        let duration : NSTimeInterval = 3.0
        let options = UIViewAnimationOptions.CurveLinear
        let delay =  NSTimeInterval( ((Int(rand()) %  900)+100.0) / 1000.0)
            
            
            // set up some constants for the fish
        let size : CGFloat = CGFloat( Int(rand()) %  60 + 20.0)
        let yPosition : CGFloat = CGFloat( Int(rand()) %  400 + 20.0)
            
        // create the fish and add it to the screen
        let fish = UIImageView()
            fish.image = UIImage(named: "fish_R.png")
            fish.frame = CGRectMake(0-size, yPosition, size, size)
        self.view.addSubview(fish)
            
            // define the animation
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                
                // move the fish
            fish.frame = CGRectMake(320, yPosition, size, size)
                
            }, completion: { animationFinished in
                    
                    // remove the fish
                fish.removeFromSuperview()
                    
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

