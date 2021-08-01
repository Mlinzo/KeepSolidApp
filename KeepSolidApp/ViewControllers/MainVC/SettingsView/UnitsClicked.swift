//
//  UnitsClicked.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit

extension MainViewController{
    @IBAction func unitsClicked(_ sender: Any){
        pickerTitle = LocalisedData.shared.defLang!.settingsPickerUnitTitle
        detailPicker.reloadAllComponents()
        currentPicker = "units"
        showPicker(true)
    }
}
