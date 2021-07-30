//
//  BuildURL.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/29/21.
//

import Foundation


enum Lang: String {
    case en
    case ru
    case ua
}
enum Units: String{
    case standard
    case metric
    case imperial
}

func buildURL() -> URL {
    var lat, lon: String
    lon = NetworkManager.shared.lon!
    lat = NetworkManager.shared.lat!
    var units: String
    var language: String
    let appid = "0ef853635aef314bc8966ae105fa06fd"
    if let un = UserSettings.defaultUnitsAPI{
            units = un
    } else {
        units = Units.metric.rawValue
    }
    if let lang = UserSettings.defaultLanguageAPI{
            language = lang
    } else {
        language = Lang.en.rawValue
    }
    
    let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&units=\(units)&lang=\(language)&exclude=hourly,minutely&appid=\(appid)" //"https://api.openweathermap.org/data/2.5/onecall?lat=46.4775&lon=30.7326&units=metric&lang=en&exclude=hourly,minutely&appid=0ef853635aef314bc8966ae105fa06fd"
    return URL(string: url)!
}
