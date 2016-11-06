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
    @IBOutlet weak var brightnessManualTextLabel: UILabel!
    @IBOutlet weak var brightnessProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(self.UIScreenBrightnessDidChange), name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
        NotificationCenter.default.post(name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
    }
    
    @objc private func UIScreenBrightnessDidChange(notification: NSNotification) {
        let brightnessFloatValue = Float(UIScreen.main.brightness)
        let brightnessPercentValue = brightnessFloatValue * 100
        brightnessTextLabel.text = String(format: "Brightness level: %.1f", brightnessPercentValue) + "%"
        brightnessProgressView.progress = brightnessFloatValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func brightnessCheckButton(_ sender: UIButton) {
        let brightnessFloatValue = Float(UIScreen.main.brightness)
        let brightnessPercentValue = brightnessFloatValue * 100
        brightnessManualTextLabel.text = String(format: "%.1f", brightnessPercentValue) + "%"
    }
    
    @IBAction func setMaxBrightnessButton(_ sender: UIButton) {
        UIScreen.main.brightness = CGFloat(1)
//        brightnessTextLabel.text = "Brightness level: Maximum"
        NotificationCenter.default.post(name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
    }
    
    @IBAction func setAvgBrightnessButton(_ sender: UIButton) {
        UIScreen.main.brightness = CGFloat(0.5)
//        brightnessTextLabel.text = "Brightness level: Average"
        NotificationCenter.default.post(name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
    }
    
    @IBAction func setMinBrightnessButton(_ sender: UIButton) {
        UIScreen.main.brightness = CGFloat(0)
//        brightnessTextLabel.text = "Brightness level: Minimum"
        NotificationCenter.default.post(name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
    }
}
