//
//  ViewController.swift
//  TipCalculator
//
//  Created by student on 9/12/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet var totalTextField  :UITextField!
    @IBOutlet var taxPctSlider  :UISlider!
    @IBOutlet var taxPctLabel :UILabel!
    @IBOutlet var tableView: UITableView!
    let cellIdentifired = "Identifired"
    let tipCalC = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int, (tipAmt:Double, total:Double)>()
    var sortedKeys:[Int] = []
    
    @IBAction func calculateTapped(sender: AnyObject) {
        tipCalC.total = Double((totalTextField.text as NSString).doubleValue)
        possibleTips = tipCalC.returnPossibleTips()
        sortedKeys = sorted(Array(possibleTips.keys))
        tableView.reloadData()
    }
    @IBAction func taxPercentageChange(sender: AnyObject) {
        tipCalC.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    func refreshUI() {
        
        totalTextField.text = String(format: "%0.2f", tipCalC.total)
        taxPctSlider.value = Float(tipCalC.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifired)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {}
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        var cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        cell.textLabel!.text = "\(tipPct)%:"
        cell.detailTextLabel!.text = String(format: "Tip: $%0.2f, Total: $%0.2f", tipAmt, total)
        return cell
    }
}

