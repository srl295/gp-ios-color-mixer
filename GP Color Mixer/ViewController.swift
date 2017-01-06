//
//  ViewController.swift
//  GP Color Mixer
//
//  Created by Steven R. Loomis on 1/5/17.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit
import GPSDK

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mixOne: UIPickerView!
    @IBOutlet weak var mixTwo: UIPickerView!
    @IBOutlet weak var mixButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Clear things up
        resultLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

