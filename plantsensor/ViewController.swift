//
//  ViewController.swift
//  plantsensor
//
//  Created by Alexander Iashchuk on 11/4/16.
//  Copyright © 2016 Alexander Iashchuk. All rights reserved.
//

import UIKit
import NotificationCenter

class ViewController: UIViewController {
    
    @IBOutlet weak var brightnessTextLabel: UILabel!
    @IBOutlet weak var brightnessProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(self.UIScreenBrightnessDidChange), name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
    }
    
    @objc private func UIScreenBrightnessDidChange(notification: NSNotification) {
        let brightnessFloatValue = Float(UIScreen.main.brightness)
        let brightnessPercentValue = brightnessFloatValue * 100
        brightnessTextLabel.text = "Brightness level: " + String(brightnessPercentValue) + "%"
        brightnessProgressView.progress = brightnessFloatValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func brightnessCheckButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
    }
}

/*
Swift 3.0 in Xcode 8

Swift 3.0 has replaced many "stringly-typed" APIs with struct "wrapper types", as is the case with NotificationCenter. Notifications are now identified by a struct Notfication.Name rather than by String. See the Migrating to Swift 3 guide.

Previous usage:

// Define identifier
let notificationIdentifier: String = "NotificationIdentifier"

// Register to receive notification
NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(YourClassName.methodOfReceivedNotification(_:)), name: notificationIdentifier, object: nil)

// Post a notification
NSNotificationCenter.defaultCenter().postNotificationName(notificationIdentifier, object: nil)

 
 
 New Swift 3.0 usage:

// Define identifier
let notificationName = Notification.Name("NotificationIdentifier")

// Register to receive notification
NotificationCenter.default.addObserver(self, selector: #selector(YourClassName.methodOfReceivedNotification), name: notificationName, object: nil)

// Post notification
NotificationCenter.default.post(name: notificationName, object: nil)
All of the system notification types are now defined as static constants on Notification.Name; i.e. .UIDeviceBatteryLevelDidChange, .UIApplicationDidFinishLaunching, .UITextFieldTextDidChange, etc.

You can extend Notification.Name with your own custom notifications in order to stay consistent with the system notifications:

// Definition:
extension Notification.Name {
    static let yourCustomNotificationName = Notification.Name("yourCustomNotificationName")
}

// Usage:
NotificationCenter.default.post(name: .yourCustomNotificationName, object: nil)






*/
