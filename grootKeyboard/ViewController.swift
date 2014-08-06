//
//  ViewController.swift
//  grootKeyboard
//
//  Created by Konstantine Mushegian on 8/5/14.
//  Copyright (c) 2014 Konstantine Mushegian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

