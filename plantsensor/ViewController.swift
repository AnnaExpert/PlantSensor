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

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(self.UIScreenBrightnessDidChange), name: NSNotification.Name.UIScreenBrightnessDidChange, object: nil)
    }
    
    @objc private func UIScreenBrightnessDidChange(notification: NSNotification) {
        let brightnessValue = Float(UIScreen.main.brightness)
        print(brightnessValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkAmbientLightSensorButton(_ sender: UIButton) {
        let brightnessCGFloatValue = UIScreen.main.brightness
        let brightnessFloatValue = Float(brightnessCGFloatValue)
        let brightnessStringValue = String(brightnessFloatValue)
        textView.text.append(String("\n" + brightnessStringValue))
    }

}
