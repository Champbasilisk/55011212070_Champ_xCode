//
//  ViewController.swift
//  Exam_1
//
//  Created by student on 10/10/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {

    @IBOutlet var name :UITextField!
    @IBOutlet var volume :UITextField!
    @IBOutlet var price :UITextField!
    @IBOutlet var show: UITextField!
    @IBOutlet var tableView: UITableView!
    var total:Double = 0
    var tvolume:Double = 0
    var tprice:Double = 0
    var profit:[Double] = [0,0,0]
    var percent = [3,5,10]
    var image = ["Bus","Helicopter","Truck"]
    @IBAction func cal(sender: AnyObject) {
        tvolume = Double((volume.text as NSString).doubleValue)
        tprice = Double((price.text as NSString).doubleValue)
        let sum = tvolume * tprice
        total=sum
        show.text = "\(total) Baht"
    }
    @IBAction func profit(sender: AnyObject) {
        let _3percent = tvolume*(tprice*3/100)
        let _5percent = tvolume*(tprice*5/100)
        let _10percent = tvolume*(tprice*10/100)
        profit.insert(_3percent, atIndex: 0)
        profit.insert(_5percent, atIndex: 1)
        profit.insert(_10percent, atIndex: 2)
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return percent.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {}
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        var imageName = UIImage(named: image[indexPath.row])
        cell.imageView!.image = imageName
        cell.textLabel!.text = String(format: "ราคาหุ้นขึ้น \(percent[indexPath.row]) : กำไร\(profit[indexPath.row])บาท")
        return cell
    }

}

