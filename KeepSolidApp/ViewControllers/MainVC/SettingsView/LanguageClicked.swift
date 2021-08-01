//
//  LanguageClicked.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit

extension MainViewController{
    @IBAction func languageClicked(_ sender: Any) {
        pickerTitle = LocalisedData.shared.defLang!.settingsPickerLanguageTitle
        detailPicker.reloadAllComponents()
        currentPicker = "language"
        showPicker(true)
    }
}
