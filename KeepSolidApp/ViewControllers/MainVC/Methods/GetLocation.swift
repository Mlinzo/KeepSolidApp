//
//  GetLocation.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit
import CoreLocation

extension MainViewController{
    func getLocation(){
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
}
