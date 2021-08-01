//
//  BackClick.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit

extension DetailViewController{
    @IBAction func backClick(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
