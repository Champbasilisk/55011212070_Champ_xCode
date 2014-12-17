//
//  ViewController.swift
//  Exam1_55011212070
//
//  Created by Student on 12/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet var stockname: UITextField!
    @IBOutlet var amount: UITextField!
    @IBOutlet var price: UITextField!
    var stocks = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func save(sender: AnyObject) {
        var alert = UIAlertController(title: "Save", message: "Save new stock", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "Yes", style: .Default)
            { (action: UIAlertAction!) -> Void in
                self.saveName(self.stockname.text)
                self.saveAmount(self.amount.text)
                self.savePrice(self.price.text)
        }
        alert.addAction(saveAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    func saveName(name: String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Stocks", inManagedObjectContext: managedContext)
        let stock = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        stock.setValue(name, forKey: "name")
        
        var error: NSError?
        if !managedContext.save(&error){
            println("Coild not save \(error), \(error?.userInfo)")
        }
        stocks.append(stock)
    }
    func saveAmount(name: String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Stocks", inManagedObjectContext: managedContext)
        let stock = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        stock.setValue(name, forKey: "amont")
        
        var error: NSError?
        if !managedContext.save(&error){
            println("Coild not save \(error), \(error?.userInfo)")
        }
        stocks.append(stock)
    }
    func savePrice(name: String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Stocks", inManagedObjectContext: managedContext)
        let stock = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        stock.setValue(name, forKey: "price")
        
        var error: NSError?
        if !managedContext.save(&error){
            println("Coild not save \(error), \(error?.userInfo)")
        }
        stocks.append(stock)
    }
}

