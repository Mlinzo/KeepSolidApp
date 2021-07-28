//
//  DetailViewController.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/20/21.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var minValue: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var maxValue: UILabel!
    @IBOutlet weak var dailyView: DailyShortView!
    
    @IBOutlet weak var morningView: DetailCustomView!
    @IBOutlet weak var afternoonView: DetailCustomView!
    @IBOutlet weak var eveningView: DetailCustomView!
    @IBOutlet weak var nightView: DetailCustomView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var windImage: UIImageView!
    @IBOutlet weak var windValue: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityImage: UIImageView!
    @IBOutlet weak var humidityValue: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var uvindexImage: UIImageView!
    @IBOutlet weak var uvindexValue: UILabel!
    @IBOutlet weak var uvindexLabel: UILabel!
    @IBOutlet weak var pressureImage: UIImageView!
    @IBOutlet weak var pressureValue: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    var dayIndex: Int?
    var day: String?
    
    let realm = try! Realm()
    var items: Results<MainModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = realm.objects(MainModel.self)
        
        afternoonView.timeLabel.text = "Afternoon"
        eveningView.timeLabel.text = "Evening"
        nightView.timeLabel.text = "Night"

        if items.count != 0 {
            dailyView.setupView(desc: items[0].daily[dayIndex!].weatherDesc, temp: items[0].daily[dayIndex!].dayTemp, image: items[0].daily[dayIndex!].weatherIcon)
            
            morningView.setupView(feels: items[0].daily[dayIndex!].mornfeelsTemp, temp: items[0].daily[dayIndex!].mornTemp, backgroundImage: "morningrect")
            afternoonView.setupView(feels: items[0].daily[dayIndex!].dayfeelsTemp, temp: items[0].daily[dayIndex!].dayTemp, backgroundImage: "afternoonrect")
            eveningView.setupView(feels: items[0].daily[dayIndex!].evefeelsTemp, temp: items[0].daily[dayIndex!].eveTemp, backgroundImage: "eveningrect")
            nightView.setupView(feels: items[0].daily[dayIndex!].nightfeelsTemp, temp: items[0].daily[dayIndex!].nightTemp, backgroundImage: "nightrect")
            
            humidityValue.text = String(items[0].daily[dayIndex!].humidity)+"%"
            windValue.text = String(items[0].daily[dayIndex!].wind)+" kmh"
            uvindexValue.text = String(items[0].daily[dayIndex!].uvindex)
            pressureValue.text = String(items[0].daily[dayIndex!].pressure)+" hPa"
            
            minValue.text = String(Int(items[0].daily[dayIndex!].minTemp))+"\u{00B0}"
            maxValue.text = String(Int(items[0].daily[dayIndex!].maxTemp))+"\u{00B0}"
        
        }
        
        headLabel.text = day!
        
    }

}
