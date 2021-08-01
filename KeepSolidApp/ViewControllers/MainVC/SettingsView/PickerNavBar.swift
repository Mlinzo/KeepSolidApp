//
//  PickerNavBar.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit

extension MainViewController{
    @IBAction func pickerSkipClicked(_ sender: Any) {
        showPicker(false)
    }
    
    @IBAction func pickerDoneClicked(_ sender: Any) {
        switch currentPicker {
        case "units":
            unitsValue.text = pickerTitle[currentPickerRow ?? 0]
        case "language":
            languageValue.text = pickerTitle[currentPickerRow ?? 0]
        default:
            break
        }
        showPicker(false)
    }
}
