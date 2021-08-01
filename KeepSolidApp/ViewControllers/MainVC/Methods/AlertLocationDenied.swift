//
//  AlertLocationDenied.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/30/21.
//

import UIKit

extension MainViewController{
    func alertLocationDenied(){
        let alert = UIAlertController(title: "Oops", message: "Couldn't receive your location", preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(
            UIAlertAction(title: "Allow location", style: .default,
                handler: { action in
                    switch action.style{
                        case .default: UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                        default: break
                    }
                }
            )
        )
    }
}
