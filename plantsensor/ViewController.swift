//
//  ViewController.swift
//  plantsensor
//
//  Created by Alexander Iashchuk on 11/4/16.
//  Copyright © 2016 Alexander Iashchuk. All rights reserved.
//

import UIKit
import Foundation
import NotificationCenter
import ImageIO

class ViewController: UIViewController {
    
    @IBOutlet weak var brightnessTextLabel: UILabel!
    @IBOutlet weak var brightnessManualTextLabel: UILabel!
    @IBOutlet weak var loadActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var brightnessProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.UIScreenBrightnessDidChange), name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
        loadActivityIndicator.startAnimating()
        let delayInSeconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.loadActivityIndicator.stopAnimating()
            NotificationCenter.default.post(name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
        }
    }
    
    func UIScreenBrightnessDidChange(notification: NSNotification) {
        self.loadActivityIndicator.stopAnimating()
        brightnessProgressView.isHidden = false
        let brightnessFloatValue = Float(UIScreen.main.brightness)
        let brightnessPercentValue = brightnessFloatValue * 100
        brightnessTextLabel.text = String(format: "Brightness level: %.1f", brightnessPercentValue) + "%"
        brightnessProgressView.progress = brightnessFloatValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func brightnessCheckButton(_ sender: UIButton) {
        let brightnessFloatValue = Float(UIScreen.main.brightness)
        let brightnessPercentValue = brightnessFloatValue * 100
        brightnessManualTextLabel.text = String(format: "%.1f", brightnessPercentValue) + "%"
        brightnessManualTextLabel.isHidden = false
    }
    
    @IBAction func setMaxBrightnessButton(_ sender: UIButton) {
        UIScreen.main.brightness = CGFloat(1)
        brightnessTextLabel.text = "Brightness level: Maximum"
        let delayInSeconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            NotificationCenter.default.post(name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
        }
    }
    
    @IBAction func setAvgBrightnessButton(_ sender: UIButton) {
        UIScreen.main.brightness = CGFloat(0.5)
        brightnessTextLabel.text = "Brightness level: Average"
        let delayInSeconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            NotificationCenter.default.post(name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
        }
    }
    
    @IBAction func setMinBrightnessButton(_ sender: UIButton) {
        UIScreen.main.brightness = CGFloat(0)
        brightnessTextLabel.text = "Brightness level: Minimum"
        let delayInSeconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            NotificationCenter.default.post(name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
        }
    }
}
