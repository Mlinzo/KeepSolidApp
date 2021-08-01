//
//  SettingsUpDoneClick.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit

extension MainViewController{
    @IBAction func settingsUpDoneClick(_ sender: Any) {
        changePositionOfSettingsView(direction: "down", animationTime: 0.5)
        UserSettings.defaultLanguage = languageValue.text
        UserSettings.defaultUnits = unitsValue.text
        waitScreen.isHidden = false
        if let lon = NetworkManager.shared.lon, let lat = NetworkManager.shared.lat{
            NetworkManager.shared.getData( sender: self)
        }
    }
    
    @IBAction func settingsCancelClick(_ sender: Any) {
        changePositionOfSettingsView(direction: "down", animationTime: 0.5)
    }
}
