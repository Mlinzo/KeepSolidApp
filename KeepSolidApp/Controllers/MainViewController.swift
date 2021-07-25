//
//  ViewController.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/15/21.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {

  
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var DailyView: DailyShortView!
    
    @IBOutlet weak var humidityValue: UILabel!
    @IBOutlet weak var humidityDesc: UILabel!
    
    @IBOutlet weak var uvindexValue: UILabel!
    @IBOutlet weak var uvindexDesc: UILabel!
    
    @IBOutlet weak var windValue: UILabel!
    @IBOutlet weak var windDesc: UILabel!
    
    @IBOutlet weak var lineShadow: UIImageView!
    @IBOutlet weak var dailyCollection: UICollectionView!
    @IBOutlet weak var collectionHeader: UILabel!

    
    func getWeek()->[String]{
        var week = Array<String>()
        for i in 0...6{
            let now = Date().addingTimeInterval(TimeInterval(86400*i))
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            let dateString = formatter.string(from: now)
            week.append(dateString)
        }
        return week
    }
    
    let realm = try! Realm()
    var mainModel = MainModel()
    var items: Results<MainModel>!
    
    override func loadView() {
        super.loadView()
        let apiurl = "https://api.openweathermap.org/data/2.5/onecall?lat=46.4775&lon=30.7326&units=metric&lang=en&exclude=hourly,minutely&appid=0ef853635aef314bc8966ae105fa06fd"
        getData(from: apiurl)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        items = realm.objects(MainModel.self)
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        dailyCollection.register(UINib(nibName: "DailyCell", bundle: nil), forCellWithReuseIdentifier: "DailyCell")
        dailyCollection.dataSource = self
        dailyCollection.delegate = self
        if items.count != 0 {
            
            humidityValue.text = String(format: "%d%%", items[0].current!.humidity)
            uvindexValue.text = String(format: "%0.0f", items[0].current!.uvIndex)
            windValue.text = String(format: "%d kmh", items[0].current!.windSpeed)
            
            DailyView.setupView(desc: items[0].current!.weatherDesc , temp: items[0].current!.temp, image: items[0].current!.weatherIcon)
        }

        
        
        let today =  DateFormatter()
        today.dateStyle = .medium
        today.timeStyle = .none
        todayLabel.text = today.string(from: Date())
        
        lineShadow.image = UIImage(named:"line_shadow")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    @IBAction func settingsClick(_ sender: UIButton) {
    }
    
}
//MARK: - MainViewController: UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let weekDate = getWeek()

        let cell = dailyCollection.dequeueReusableCell(withReuseIdentifier: "DailyCell", for: indexPath) as! DailyCell
        if items.count != 0 {
            cell.setupCell(image: items[0].daily[indexPath.item].weatherIcon, temp: items[0].daily[indexPath.item].dayTemp, date: weekDate[indexPath.item])
        }
        return cell
    }
}
//MARK: -- MainViewController: UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weekDate = getWeek()
        let vc = getViewControllerByID("detailVC") as! DetailViewController
        vc.dayIndex = indexPath.item
        vc.day = weekDate[indexPath.item]
        navigationController?.show(vc, sender: self)
        
    }
}

