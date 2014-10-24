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
    @IBOutlet var age: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var gender: UITextField!
    @IBOutlet var mail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func myVCDidFinish(controller: ColorTwoViewController, text: String) {
        colorlabel.text = text
        controller.navigationController?.popViewControllerAnimated(true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue"{
            let vc = segue.destinationViewController as ColorTwoViewController
            vc.nameString = name.text!
            vc.ageString = age.text!
            vc.genderString = gender.text!
            vc.mailString = mail.text!
            vc.delegate = self
        }
    }
}

