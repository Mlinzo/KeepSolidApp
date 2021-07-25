//
//  SetData.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/25/21.
//

import Foundation
import RealmSwift

let realm = try! Realm()
var currentModel = CurrentModel()
var mainModel = MainModel()
    
func setData(data: Response) -> Void {
    currentModel.temp = Float(data.current.temp)
    currentModel.uvIndex = Float(data.current.uvi)
    currentModel.weatherIcon = data.current.weather[0].icon
    currentModel.weatherDesc = data.current.weather[0].description
    currentModel.humidity = data.current.humidity
    currentModel.windSpeed = data.current.wind_speed
    currentModel.pressure = data.current.pressure
    
    mainModel.current = currentModel
    
    for i in 0...6{
        let dailyModel = DailyModel()
        dailyModel.minTemp = Float(data.daily[i].temp.min)
        dailyModel.maxTemp = Float(data.daily[i].temp.max)
        dailyModel.mornTemp = Float(data.daily[i].temp.morn)
        dailyModel.mornfeelsTemp = Float(data.daily[i].feels_like.morn)
        dailyModel.dayTemp = Float(data.daily[i].temp.day)
        dailyModel.dayfeelsTemp = Float(data.daily[i].feels_like.day)
        dailyModel.eveTemp = Float(data.daily[i].temp.eve)
        dailyModel.evefeelsTemp = Float(data.daily[i].feels_like.eve)
        dailyModel.nightTemp = Float(data.daily[i].temp.night)
        dailyModel.nightfeelsTemp = Float(data.daily[i].feels_like.night)
        dailyModel.weatherIcon = data.daily[i].weather[0].icon
        mainModel.daily.append(dailyModel)
    }

    try! realm.write{
        realm.deleteAll()
        realm.add(mainModel)
    }
    
}
