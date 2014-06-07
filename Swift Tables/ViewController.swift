//
//  ViewController.swift
//  Swift Tables
//
//  Created by Yazid Azahari on 6/6/14.
//  Copyright (c) 2014 Yazid Azahari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailViewProtocol {
    @IBOutlet
    var tableView: UITableView
    
    var dataSource = String[]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.append("Element 1")
        dataSource.append("Element 2")
        dataSource.append("Element 3")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow(), animated: true)
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "detail"{
            var destinationVC:DetailViewController = segue.destinationViewController as DetailViewController
            destinationVC.delegate = self
            destinationVC.parentSelection = self.tableView.indexPathForSelectedRow().row
        }
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel.text = self.dataSource[indexPath.row]
        
        return cell
    }
    
    func didFinishDetailView(string: String) {
        self.navigationController.popViewControllerAnimated(true)
        
        dataSource[tableView.indexPathForSelectedRow().row] = string
        tableView.reloadRowsAtIndexPaths([tableView.indexPathForSelectedRow()], withRowAnimation: UITableViewRowAnimation.None)
        
        var alert = UIAlertController(title: "Alert", message: "You typed \"\(string)\"", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

