//
//  SetLocationErrorView.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit

extension MainViewController{
    func setLocationErrorView(){
        waitScreen.isHidden = false
        waitScreenIndicator.isHidden = true
        waitScreenLabel.text = "Location not established"
    }
}
