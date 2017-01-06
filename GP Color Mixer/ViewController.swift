//
//  ViewController.swift
//  GP Color Mixer
//
//  Created by Steven R. Loomis on 1/5/17.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit
import GPSDK

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var mixOne: UIPickerView!
    @IBOutlet weak var mixTwo: UIPickerView!
    @IBOutlet weak var mixButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Clear things up
        resultLabel.text = ""
    }

    @IBAction func doMix(_ sender: Any) {
        let color1 = primaryColors[mixOne.selectedRow(inComponent: 0)]
        let color2 = primaryColors[mixTwo.selectedRow(inComponent: 0)]
        
        let newColor = color1.mix(with: color2)
        
        resultLabel.text = newColor.simpleDescription()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // pickerview stuff
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3;
    }
    
    let primaryColors = [ Color.red, Color.blue, Color.yellow ]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return primaryColors[row].simpleDescription()
    }
}

