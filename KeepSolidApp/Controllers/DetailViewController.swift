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
    
    let realm = try! Realm()
    var items: Results<MainModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = realm.objects(MainModel.self)
        
        dailyView.setupView(desc: items[0].current!.weatherDesc, temp: items[0].current!.temp, image: items[0].current!.weatherIcon)

        
        let today =  DateFormatter()
        today.dateStyle = .medium
        today.timeStyle = .none
        headLabel.text = today.string(from: Date())
        
        morningView.setupView(feels: items[0].daily[0].mornfeelsTemp, temp: items[0].daily[0].mornTemp, backgroundImage: "morningrect") //daily[0] - day what we need
        afternoonView.setupView(feels: items[0].daily[0].dayfeelsTemp, temp: items[0].daily[0].dayTemp, backgroundImage: "afternoonrect") //daily[0] - day what we need
        eveningView.setupView(feels: items[0].daily[0].evefeelsTemp, temp: items[0].daily[0].eveTemp, backgroundImage: "eveningrect") //daily[0] - day what we need
        nightView.setupView(feels: items[0].daily[0].nightfeelsTemp, temp: items[0].daily[0].nightTemp, backgroundImage: "nightrect") //daily[0] - day what we need
    }

}
