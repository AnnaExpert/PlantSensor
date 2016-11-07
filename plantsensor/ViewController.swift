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

class ViewController: UIViewController {
    
    @IBOutlet weak var brightnessTextLabel: UILabel!
    @IBOutlet weak var brightnessHiddenTextLabel: UILabel!
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
        let brightnessFloatValue = Float(UIScreen.main.brightness)
        let brightnessPercentValue = brightnessFloatValue * 100
        self.brightnessHiddenTextLabel.isHidden = true
        brightnessTextLabel.text = String(format: "Brightness level is %.1f", brightnessPercentValue) + "%"
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
    
    @IBAction func setMinBrightnessButton(_ sender: UIButton!) {
        UIScreen.main.brightness = CGFloat(0)
        brightnessTextLabel.text = "Calibrating sensor..."
        loadActivityIndicator.startAnimating()
        let delayInSecondsTwo = 2.0
        let delayInSecondsFour = 4.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSecondsTwo) {
            self.brightnessTextLabel.text = "Checking brightness..."
            self.brightnessHiddenTextLabel.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSecondsFour) {
            NotificationCenter.default.post(name: Notification.Name.UIScreenBrightnessDidChange, object: nil)
        }
    }
}
