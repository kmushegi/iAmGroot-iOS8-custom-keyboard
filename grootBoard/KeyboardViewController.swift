//
//  KeyboardViewController.swift
//  grootBoard
//
//  Created by Konstantine Mushegian on 8/5/14.
//  Copyright (c) 2014 Konstantine Mushegian. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var nextKeyboardButton: UIButton!
    var iAmGroot: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardButtons()
        
    }
    /*
    *********************************DISCLAIMER*********************************
    
    custom keyboard does not have a "delete" button; this is done on purpose,
    keyboard's only functionality is to make it easier to say you are groot.
    
    ****************************************************************************
    */
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
        
        //adding action to the button
        iAmGroot.addTarget(self, action: "didTapGroot", forControlEvents: .TouchUpInside)
        
        //button appearance changes
        iAmGroot.titleLabel.font = UIFont.systemFontOfSize(54)
        iAmGroot.setTitleColor(UIColor(white: 0.0, alpha: 1.0), forState: .Normal)
        iAmGroot.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        iAmGroot.layer.cornerRadius = 5
        
        view.addSubview(iAmGroot)
        
        //button placement on the screen
        var grootCenterYConstraint = NSLayoutConstraint(item: iAmGroot, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        var grootCenterXConstaint = NSLayoutConstraint(item: iAmGroot, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        
        view.addConstraints([grootCenterXConstaint,grootCenterYConstraint])
        
    }
    //action responsible for inputting the text
    func didTapGroot() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("I AM GROOT")
    }
    
    //functionality to change input to next keyboard
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

}
