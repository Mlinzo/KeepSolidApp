//
//  DailyModel.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/22/21.
//
import Foundation
import RealmSwift

class DailyModel: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var minTemp: Float = 0.0
    @Persisted var maxTemp: Float = 0.0
    
    @Persisted var mornTemp: Float = 0.0
    @Persisted var mornfeelsTemp: Float = 0.0
    @Persisted var dayTemp: Float = 0.0
    @Persisted var dayfeelsTemp: Float = 0.0
    @Persisted var eveTemp: Float = 0.0
    @Persisted var evefeelsTemp: Float = 0.0
    @Persisted var nightTemp: Float = 0.0
    @Persisted var nightfeelsTemp: Float = 0.0
    
    @Persisted var wind: Int = 0
    @Persisted var humidity: Int = 0
    @Persisted var uvindex: Int = 0
    @Persisted var pressure: Int = 0
    
    
    @Persisted var weatherIcon: String = ""
    @Persisted var weatherDesc: String = ""
}
