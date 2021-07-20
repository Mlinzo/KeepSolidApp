//
//  GetViewControllerByID.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/20/21.
//
import UIKit

extension UIViewController {
    func getViewControllerByID(_ id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: id)
    }
}
