//
//  StockViewController.swift
//  Exam1_55011212070
//
//  Created by Student on 12/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit
import CoreData
class StockViewController: UIViewController {
    var stocks = [NSManagedObject]()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appdelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appdelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Stocks")
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults{
            stocks = results
        }else{
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        let stock = stocks[indexPath.row]
        let itemName = stock.valueForKey("name") as String?
        cell.textLabel!.text = itemName
        return cell
    }
}
