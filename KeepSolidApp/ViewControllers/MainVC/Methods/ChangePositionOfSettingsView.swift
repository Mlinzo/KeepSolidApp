//
//  ChangePositionOfSettingsView.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit

extension MainViewController{
    func changePositionOfSettingsView(direction: String, animationTime: TimeInterval){
        if(direction=="up") {
            settingsOnScreen = true
            isDownConstraint.isActive = false
            downConstraint.isActive = true
            self.view.layoutIfNeeded()
        } else if (direction=="down"){
            settingsOnScreen = false
            downConstraint.isActive = false
            isDownConstraint.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}
