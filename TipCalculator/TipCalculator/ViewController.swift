//
//  ViewController.swift
//  TipCalculator
//
//  Created by student on 9/12/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalTextField  :UITextField!
    @IBOutlet var taxPctSlider  :UISlider!
    @IBOutlet var taxPctLabel :UILabel!
    @IBOutlet var resultTextView  :UITextView!
    
    let tipCalC = TipCalculatorModel(total: 33.25, taxPct: 0.06)

    @IBAction func calculateTapped(sender: AnyObject) {
        tipCalC.total = Double((totalTextField.text as NSString).doubleValue)
        
        let possibleTips = tipCalC.returnPossibleTips()
        var result = ""
        
        for (tipPct, tipValue) in possibleTips {
            result += "\(tipPct)%: \(tipValue)\n"
        }
        resultTextView.text = result
    }
    
    @IBAction func taxPercentageChange(sender: AnyObject) {
        tipCalC.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
       func refreshUI() {
        //1
        totalTextField.text = String(format: "%0.2f", tipCalC.total)
        //2
        taxPctSlider.value = Float(tipCalC.taxPct) * 100.0
        //3
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        //4
        resultTextView.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

