//
//  ViewController.swift
//  LoginApp
//
//  Created by Rene Fürst on 14/10/14.
//  Copyright (c) 2014 Rene Fürst. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var theTextFieldUsername: UITextField!
    
    
    @IBOutlet weak var theTextFieldPassword: UITextField!
    
    @IBOutlet weak var theLabel: UILabel!
    
    @IBAction func theVerifyMethod(sender: AnyObject) {
    
        var usr = "car"
        var pw = "black"
        
        if theTextFieldUsername.text == usr && theTextFieldPassword.text == pw
        {
            theLabel.text = "Login correct"
            theLabel.textColor = UIColor.greenColor()
            theLabel.backgroundColor = UIColor.yellowColor()
            theTextFieldUsername.resignFirstResponder()
            theTextFieldPassword.resignFirstResponder()
        
            println("Password was correct")
            
        }
        
        else
            
        {
            theLabel.text = "Login incorrect"
            theLabel.textColor = UIColor.redColor()
            theLabel.backgroundColor = UIColor.magentaColor()
            theTextFieldUsername.resignFirstResponder()
            theTextFieldPassword.resignFirstResponder()
            

            
            println("Password were not correct")
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

