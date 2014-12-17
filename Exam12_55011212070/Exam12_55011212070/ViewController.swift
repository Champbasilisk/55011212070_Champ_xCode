//
//  ViewController.swift
//  Exam12_55011212070
//
//  Created by Student on 12/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    var stocks = [NSManagedObject]()
    @IBOutlet var tableView: UITableView!
    @IBAction func addItem(sender: AnyObject) {
        var alert = UIAlertController(title: "New Stock", message: "Add a new Stock", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "Save", style: .Default)
            { (action: UIAlertAction!) -> Void in
                
                let textField = alert.textFields![0] as UITextField
                self.saveName(textField.text)
                self.tableView.reloadData()
                
        }
        alert.addTextFieldWithConfigurationHandler{(textField: UITextField!) -> Void in}
        presentViewController(alert, animated: true, completion: nil)
    }
    func saveName(name: String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        item.setValue(name, forKey: "name")
        
        var error: NSError?
        if !managedContext.save(&error){
            println("Coild not save \(error), \(error?.userInfo)")
        }
        stocks.append(item)
        
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
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"TH Stock\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Mark up tableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        let item = stocks[indexPath.row ]
        let itemName = item.valueForKey("name") as String?
        cell.textLabel!.text = itemName
        return cell
    }
}

