//
//  DetailViewController.swift
//  Swift Tables
//
//  Created by Yazid Azahari on 6/6/14.
//  Copyright (c) 2014 Yazid Azahari. All rights reserved.
//

import UIKit

protocol DetailViewProtocol {
    func didFinishDetailView(string:String)
}

class DetailViewController: UIViewController {
    var parentSelection:Int?
    var delegate: ViewController?
    @IBOutlet
    var textField:UITextField
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool){
        super.viewDidAppear(animated)
        
        var alert = UIAlertController(title: "Alert", message: "You selected cell at index \(parentSelection)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButtonPressed() {
        self.view.endEditing(true)
        
        if self.textField.text.isEmpty {
            var alert = UIAlertController(title: "Alert", message: "You should type something before dismissing", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            self.delegate?.didFinishDetailView(self.textField.text)
        }
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
