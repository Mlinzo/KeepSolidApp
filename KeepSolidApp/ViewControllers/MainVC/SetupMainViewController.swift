//
//  SetupViewController.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/28/21.
//
import UIKit
import RealmSwift

func setupMainViewController(_ vc: MainViewController) -> Void{
    let data = LocalisedData.shared.defLang
    let realm = try! Realm()
    let items = realm.objects(MainModel.self)
    realm.refresh()
    
    let units: String
    if UserSettings.defaultUnitsAPI == "imperial" {
        units = data!.windSpeedUnits[1]
    } else {
        units = data!.windSpeedUnits[0]
    }
    
    vc.humidityValue.text = String(format: "%d%%", items[0].current!.humidity)
    vc.humidityDesc.text = data?.humidityTitle
    vc.uvindexValue.text = String(format: "%.0f", items[0].current!.uvIndex)
    vc.uvindexDesc.text = data?.uvindexTitle
    vc.windValue.text = String(format: "%d \(units)", items[0].current!.windSpeed)
    vc.windDesc.text = data?.windTitle
    vc.DailyView.setupView(desc: items[0].current!.weatherDesc , temp: items[0].current!.temp, image: items[0].current!.weatherIcon)
    vc.todayLabel.text = todayString(locale: UserSettings.dateLocale ?? "en_EN")
    vc.dailyCollection.reloadData()
    vc.cancelButton.title = data?.settingsCancelButtonTitle
    vc.upDoneButton.title = data?.settingsDoneButtonTitle
    vc.settingsTitle.text = data?.settingsTitle
    vc.unitsLabel.text = data?.settingsUnitsTitle
    vc.languageLabel.text = data?.settingsLanguageTitle
    vc.skipButton.title = data?.settingsPickerSkipButtonTitle
    vc.downDoneButton.title = data?.settingsPickerDoneButtonTitle
    vc.languageValue.text = UserSettings.defaultLanguage
    vc.unitsValue.text = UserSettings.defaultUnits
    vc.collectionHeader.text = data?.weekTitle
    if let lon = NetworkManager.shared.lon, let lat = NetworkManager.shared.lat{
        vc.waitScreenLabel.text = data?.waitScreen
        vc.waitScreenIndicator.isHidden = false
        vc.waitScreen.isHidden = true
    }
}
