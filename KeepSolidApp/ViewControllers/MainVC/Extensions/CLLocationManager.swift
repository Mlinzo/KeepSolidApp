//
//  CLLocationManager.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/30/21.
//

import UIKit
import CoreLocation

extension MainViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last {
            locationManager?.stopUpdatingLocation()
            let lat = String(format: "%.4f", loc.coordinate.latitude)
            let lon = String(format: "%.4f", loc.coordinate.longitude)
            NetworkManager.shared.lon = lon
            NetworkManager.shared.lat = lat
            if let lo = NetworkManager.shared.lon, let la = NetworkManager.shared.lat{
                NetworkManager.shared.getData( sender: self)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint("location error - ",error)
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager?.authorizationStatus{
                case .denied, .restricted: alertLocationDenied()
                case .authorizedAlways, .authorizedWhenInUse, .notDetermined: break
                default: break
            }
        }
    }
}
