//
//  SetupViewController.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/28/21.
//
import UIKit
import RealmSwift

func setupViewController(_ vc: MainViewController) -> Void{
    DispatchQueue.main.async {
        let realm = try! Realm()
        let items = realm.objects(MainModel.self)
        vc.humidityValue.text = String(format: "%d%%", items[0].current!.humidity)
        vc.uvindexValue.text = String(format: "%.0f", items[0].current!.uvIndex)
        print(items[0].current!.uvIndex)
        vc.windValue.text = String(format: "%d kmh", items[0].current!.windSpeed)
        vc.DailyView.setupView(desc: items[0].current!.weatherDesc , temp: items[0].current!.temp, image: items[0].current!.weatherIcon)
        vc.lineShadow.image = UIImage(named:"line_shadow")
        vc.todayLabel.text = todayString()
        vc.dailyCollection.reloadData()
        
        vc.waitScreen.isHidden = true
    }
}
