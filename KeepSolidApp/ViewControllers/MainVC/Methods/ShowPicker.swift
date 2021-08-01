//
//  ShowPicker.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit

extension MainViewController{
    func showPicker(_ show: Bool){
        detailPicker.isHidden = !show
        detailNavBar.isHidden = !show
    }
}
