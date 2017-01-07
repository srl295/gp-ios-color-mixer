/*
 * Copyright IBM Corp. 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import GPSDK

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var mixOne: UIPickerView!
    @IBOutlet weak var mixTwo: UIPickerView!
    @IBOutlet weak var mixButton: UIButton!
    
    let gp = GPService()

    func get(key: String) -> String {
        return gp.localizedString(key, nil)
    }
    
    func get(color: Color) -> String {
        return get(key: color.simpleDescription())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = "Loading…"
        do {
            try gp.initService(url:        ReaderCredentials.url,
                                    instanceId: ReaderCredentials.instanceId,
                                    bundleId:   ReaderCredentials.bundleId,
                                    userId:     ReaderCredentials.userId,
                                    password:   ReaderCredentials.password,
                                    
                                    languageId:nil,
                                    alwaysLoadFromServer: false,
                                    expireAfter: 0)
            
            // set up strings
            titleLabel.text = get(key: "title")
            mixButton.setTitle(get(key: "mix"), for: UIControlState.normal)
            mixButton.titleLabel?.text = get(key: "mix")
            resultLabel.text = "" // clear this
        } catch GPService.GPError.languageNotSupported {
            resultLabel.text = ("This language is not supported...")
        } catch GPService.GPError.requestServerError(let errorDescription) {
            resultLabel.text = ("Request server error: " + errorDescription)
        } catch GPService.GPError.HTTPError(let statusCode) {
            resultLabel.text = ("Request server error: HTTP \(statusCode)")
        } catch {
            resultLabel.text = ("Other error")
        }
    }

    @IBAction func doMix(_ sender: Any) {
        let color1 = primaryColors[mixOne.selectedRow(inComponent: 0)]
        let color2 = primaryColors[mixTwo.selectedRow(inComponent: 0)]
        
        let newColor = color1.mix(with: color2)
        
        resultLabel.text = get(color: newColor)
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
        return get(color: primaryColors[row])
    }
}

