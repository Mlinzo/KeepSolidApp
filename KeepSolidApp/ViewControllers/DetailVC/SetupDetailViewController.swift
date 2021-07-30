//
//  SetupDetailViewController.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/30/21.
//

import Foundation
import RealmSwift

func setupDetViewController(_ vc: DetailViewController) -> Void {
    let data = LocalisedData.shared.defLang
    let realm = try! Realm()
    let items = realm.objects(MainModel.self)
    realm.refresh()
    
    let dayIndex = vc.dayIndex
    let day = vc.day
    let units: String
    if UserSettings.defaultUnitsAPI == "imperial" {
        units = data!.windSpeedUnits[1]
    } else {
        units = data!.windSpeedUnits[0]
    }
    
    vc.detailBackButon.title = data!.detailBackButton
    vc.dailyView.setupView(desc: items[0].daily[dayIndex!].weatherDesc, temp: items[0].daily[dayIndex!].dayTemp, image: items[0].daily[dayIndex!].weatherIcon)
    vc.minLabel.text = data!.minLabel
    vc.maxLabel.text = data!.maxLabel
    vc.morningView.setupView(feels: items[0].daily[dayIndex!].mornfeelsTemp, feelsLabel: data!.feelsLabel, temp: items[0].daily[dayIndex!].mornTemp, tempLabel: data!.tempLabel, backgroundImage: "morningrect", dayPeriod: data!.dayPeriod[0])
    vc.afternoonView.setupView(feels: items[0].daily[dayIndex!].dayfeelsTemp, feelsLabel: data!.feelsLabel, temp: items[0].daily[dayIndex!].dayTemp, tempLabel: data!.tempLabel,  backgroundImage: "afternoonrect", dayPeriod:  data!.dayPeriod[1] )
    vc.eveningView.setupView(feels: items[0].daily[dayIndex!].evefeelsTemp, feelsLabel: data!.feelsLabel, temp: items[0].daily[dayIndex!].eveTemp, tempLabel: data!.tempLabel, backgroundImage: "eveningrect", dayPeriod: data!.dayPeriod[2])
    vc.nightView.setupView(feels: items[0].daily[dayIndex!].nightfeelsTemp, feelsLabel: data!.feelsLabel, temp: items[0].daily[dayIndex!].nightTemp, tempLabel: data!.tempLabel, backgroundImage: "nightrect", dayPeriod: data!.dayPeriod[3])
    vc.detailsLabel.text = data!.detailsLabel
    vc.humidityValue.text = String(items[0].daily[dayIndex!].humidity)+"%"
    vc.humidityLabel.text = data!.humidityTitle
    vc.windValue.text = String(items[0].daily[dayIndex!].wind)+" "+units
    vc.windLabel.text = data!.windTitle
    vc.uvindexValue.text = String(items[0].daily[dayIndex!].uvindex)
    vc.uvindexLabel.text = data!.uvindexTitle
    vc.pressureValue.text = String(items[0].daily[dayIndex!].pressure)+" "+data!.pressureUnits
    vc.pressureLabel.text = data!.pressureLabel
    vc.minValue.text = String(Int(items[0].daily[dayIndex!].minTemp))+"\u{00B0}"
    vc.maxValue.text = String(Int(items[0].daily[dayIndex!].maxTemp))+"\u{00B0}"

    vc.headLabel.text = day!
}

