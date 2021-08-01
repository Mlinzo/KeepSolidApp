//
//  SettingsClicked.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit

extension MainViewController{
    @IBAction func settingsClick(_ sender: UIButton) {
        if(settingsOnScreen == false){
            changePositionOfSettingsView(direction: "up", animationTime: 0.5)
        }
    }
}
