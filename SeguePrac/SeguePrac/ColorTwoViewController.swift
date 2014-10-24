//
//  ColorTwoViewController.swift
//  SeguePrac
//
//  Created by Student on 10/22/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit
protocol ColorTwoViewControllerDelegate{
    func myVCDidFinish(controller:ColorTwoViewController,text:String)
}

class ColorTwoViewController: UIViewController {

    @IBOutlet var colorLabel: UILabel!
    var delegate:ColorTwoViewControllerDelegate? = nil
    var colorString = ""
    @IBAction func saveColor(sender: UIBarButtonItem) {
        if (delegate != nil) {
            delegate!.myVCDidFinish(self, text: colorLabel!.text!)
        }
    }
    @IBAction func colorSelectionButton(sender: UIButton) {
        colorLabel.text = sender.titleLabel!.text!
        colorLabel.backgroundColor = sender.backgroundColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.text = colorString
        // Do any additional setup after loading the view.
    }
}
