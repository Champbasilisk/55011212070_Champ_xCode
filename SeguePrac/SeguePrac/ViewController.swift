//
//  ViewController.swift
//  SeguePrac
//
//  Created by Student on 10/22/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ColorTwoViewControllerDelegate {

    @IBOutlet var colorlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func myVCDidFinish(controller: ColorTwoViewController, text: String) {
        colorlabel.text = text
        if(text=="Red"){
            colorlabel.backgroundColor = UIColor(red: 250/255.0, green: 154/255.0, blue: 150/255.0, alpha: 1.0)
        }
        else if(text=="Green"){
            colorlabel.backgroundColor = UIColor(red: 157/255.0, green: 254/255.0, blue: 188/255.0, alpha: 1.0)
        }
        else if(text=="Blue"){
            colorlabel.backgroundColor = UIColor(red: 144/255.0, green: 200/255.0, blue: 253/255.0, alpha: 1.0)
        }
        controller.navigationController?.popViewControllerAnimated(true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue"{
            let vc = segue.destinationViewController as ColorTwoViewController
            vc.colorString = colorlabel.text!
            vc.delegate = self
        }
    }
}

