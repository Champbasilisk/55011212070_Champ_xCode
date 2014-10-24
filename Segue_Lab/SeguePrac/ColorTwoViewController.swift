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

    @IBOutlet var showView: UITextView!
    @IBOutlet var status: UILabel!
    var delegate:ColorTwoViewControllerDelegate? = nil
    var nameString = ""
    var ageString = ""
    var genderString = ""
    var mailString = ""
    @IBAction func save(sender: UIBarButtonItem) {
        if (delegate != nil) {
            delegate!.myVCDidFinish(self, text: nameString)
        }
    }
    @IBAction func colorSelectionButton(sender: UIButton) {
        status.text = sender.titleLabel!.text!
        status.backgroundColor = sender.backgroundColor
        if (sender.titleLabel!.text == "Delete"){
            showView.text = ""
            nameString = ""
            ageString = ""
            genderString = ""
            mailString = ""
            showView.backgroundColor = UIColor.clearColor()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showView.text = "User Name : \(nameString)\nAge : \(ageString)\nGender : \(genderString)\nEmail : \(mailString)"
        // Do any additional setup after loading the view.
    }
}
