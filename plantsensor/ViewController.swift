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
        NotificationCenter.default.addObserver(self, selector: #selector(self.UIScreenBrightnessDidChange), name: NSNotification.Name.UIScreenBrightnessDidChange, object: nil)
    }
    
    @objc private func UIScreenBrightnessDidChange(notification: NSNotification) {
        let brightnessFloatValue = Float(UIScreen.main.brightness)
        let brightnessPercentValue = brightnessFloatValue * 100
//        print(brightnessFloatValue)
        brightnessTextLabel.text = "Brightness level: " + String(brightnessPercentValue) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
