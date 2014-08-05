//
//  KeyboardViewController.swift
//  grootBoard
//
//  Created by Konstantine Mushegian on 8/5/14.
//  Copyright (c) 2014 Konstantine Mushegian. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    //@IBOutlet weak var nextKeyboardButton: UIButton!
    
    var nextKeyboardButton: UIButton!
    var iAmGroot: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Perform custom UI setup here
        addKeyboardButtons()
        
    }
    
    func addKeyboardButtons() {
        addGroot()
        addNextKeyboardButton()
    }
    
    func addGroot() {
        //initializing the button
        iAmGroot = UIButton.buttonWithType(.System) as UIButton
        iAmGroot.setTitle("I AM GROOT", forState: .Normal)
        iAmGroot.sizeToFit()
        iAmGroot.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        iAmGroot.addTarget(self, action: "didTapGroot", forControlEvents: .TouchUpInside)
        
        iAmGroot.titleLabel.font = UIFont.systemFontOfSize(54)
        iAmGroot.setTitleColor(UIColor(white: 0.0, alpha: 1.0), forState: .Normal)
        
        
        iAmGroot.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        iAmGroot.layer.cornerRadius = 5
        
        view.addSubview(iAmGroot)
        
        var grootCenterYConstraint = NSLayoutConstraint(item: iAmGroot, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        var grootCenterXConstaint = NSLayoutConstraint(item: iAmGroot, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        
        view.addConstraints([grootCenterXConstaint,grootCenterYConstraint])
        
    }
    
    func didTapGroot() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("I AM GROOT")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    func addNextKeyboardButton() {
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }

}
