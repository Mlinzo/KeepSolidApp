//
//  Daily.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/18/21.
//

import UIKit

struct Elements {
    var image: UIImage
    var temp: String
    var date: String
}

class Menu{
    
    var elements: [Elements] = []
    
    func addDay(image: String, temp: String, date: String){
        let d = Elements(image: UIImage(named: image)! , temp: temp, date: date)
        self.elements.append(d)
    }
    
    init() {
       
    }
    
}
