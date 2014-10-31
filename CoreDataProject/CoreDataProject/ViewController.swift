//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Student on 10/31/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    var items = [NSManagedObject]()
    var image = ["food","cheez","bread","beef","chicken","hamberger","egg","milk","apple","fish"];
    @IBOutlet var tableView: UITableView!
    @IBAction func addItem(sender: AnyObject) {
        var alert = UIAlertController(title: "New Item", message: "Add a new item", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "Save", style: .Default)
            { (action: UIAlertAction!) -> Void in
            
            let textField = alert.textFields![0] as UITextField
            self.saveName(textField.text)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default)
            { (action: UIAlertAction!) -> Void in}
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
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
        items.append(item)
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appdelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appdelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Item")
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults{
            items = results
        }else{
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"Shopping List\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Mark up tableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        let item = items[indexPath.row ]
        let itemName = item.valueForKey("name") as String?
        cell.textLabel!.text = itemName
        return cell
    }
    @IBAction func deleteAllData(sender: UIButton) {
        let appdelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext: NSManagedObjectContext = appdelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        let fetchRequest = NSFetchRequest(entityName: "Item")
        
        managedContext.deletedObjects
        item.setValue(nil, forKeyPath: "name")
        tableView.reloadData()
    }
}
