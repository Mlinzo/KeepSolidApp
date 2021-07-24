//
//  CurrentModel.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/22/21.
//
import Foundation
import RealmSwift

class CurrentModel: Object {
    @Persisted var temp: Float = 0.0
    @Persisted var uvIndex: Float = 0.0
    @Persisted var weatherIcon: String = "" //String????
    @Persisted var weatherDesc: String = ""
    @Persisted var humidity: Int = 0
    @Persisted var windSpeed: Int = 0
    @Persisted var pressure: Int = 0
}
