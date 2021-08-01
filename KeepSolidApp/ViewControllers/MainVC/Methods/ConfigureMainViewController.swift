//
//  ConfigureMainViewController.swift
//  KeepSolidApp
//
//  Created by user201878 on 8/1/21.
//

import UIKit

extension MainViewController{
    func configureMainViewController(){
        changePositionOfSettingsView(direction: "down", animationTime: 0)
        dailyCollection.register(UINib(nibName: "DailyCell", bundle: nil), forCellWithReuseIdentifier: "DailyCell")
        
        locationManager?.delegate = self
        dailyCollection.dataSource = self
        dailyCollection.delegate = self
        detailPicker.dataSource = self
        detailPicker.delegate = self
        
        setLocationErrorView()
        
        items = realm.objects(MainModel.self)
        if UserSettings.defaultLanguage == nil {
            UserSettings.defaultLanguage = "English"
        }
        if UserSettings.defaultUnits == nil {
            UserSettings.defaultUnits = LocalisedData.shared.defLang?.settingsPickerUnitTitle[1]
        }
    }
}
