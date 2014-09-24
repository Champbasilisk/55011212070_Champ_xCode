//
//  ViewController.swift
//  OneTwoThree
//
//  Created by student on 9/12/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var LOne: UILabel!
    @IBOutlet var LTwo: UILabel!
    @IBOutlet var LThree: UILabel!

    var num1 = 0
    var num2 = 0
    var num3 = 0
    @IBAction func Clickone(sender: AnyObject) {
        num1 += 1
        LOne.text = "\(num1)"
        
    }
    @IBAction func Clicktwo(sender: AnyObject) {
        num2 += 1
        LTwo.text = "\(num2)"
    }
    @IBAction func Clickthree(sender: AnyObject) {
        num3 += 1
        LThree.text = "\(num3)"
    }
    
    @IBAction func ClickReset(sender: AnyObject) {
        var num1 = 0
        var num2 = 0
        var num3 = 0
        
        LOne.text = "0"
        LTwo.text = "0"
        LThree.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

