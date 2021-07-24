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
    var dailyModel = DailyModel()
    var currentModel = CurrentModel()
    var mainModel = MainModel()
    var items: Results<MainModel>!
    
    func setData() -> Void {
        currentModel.temp = 12.0
        currentModel.uvIndex = 12.0
        currentModel.weatherIcon = "partlycloudy"
        currentModel.weatherDesc = "bla"
        currentModel.humidity = 12
        currentModel.windSpeed = 12
        currentModel.pressure = 12
        
        for _ in 1...7{
            dailyModel.minTemp = 17.0
            dailyModel.maxTemp = 17.0
            dailyModel.mornTemp = 17.0
            dailyModel.mornfeelsTemp = 17.0
            dailyModel.dayTemp = 17.0
            dailyModel.dayfeelsTemp = 17.0
            dailyModel.eveTemp = 17.0
            dailyModel.evefeelsTemp = 17.0
            dailyModel.nightTemp = 17.0
            dailyModel.nightfeelsTemp = 17.0
            dailyModel.weatherIcon = "partlycloudy"
            mainModel.daily.append(dailyModel)
        }

        mainModel.current = currentModel
        
        try! realm.write{
            realm.add(mainModel)
        }
        
        dailyCollection.reloadData()
    }
    
//    override func loadView() {
//        super.loadView()
//
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        items = realm.objects(MainModel.self)
        
        dailyCollection.register(UINib(nibName: "DailyCell", bundle: nil), forCellWithReuseIdentifier: "DailyCell")
        dailyCollection.dataSource = self
        dailyCollection.delegate = self
        
        setData()
        
        humidityValue.text = String(format: "%d%%", items[0].current!.humidity)
        uvindexValue.text = String(format: "%0.0f", items[0].current!.uvIndex)
        windValue.text = String(format: "%d kmh", items[0].current!.windSpeed)
        
        DailyView.setupView(desc: items[0].current!.weatherDesc , temp: items[0].current!.temp, image: items[0].current!.weatherIcon)
        
        
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
//        for i in 0...6{
//            menu.addDay(image: "partlycloudy", temp: "\(30)", date: "\(weekDate[i])")
//        }


        let cell = dailyCollection.dequeueReusableCell(withReuseIdentifier: "DailyCell", for: indexPath) as! DailyCell
        cell.setupCell(daily: items[0].daily[indexPath.item], date: weekDate[indexPath.item])
        return cell
    }
}
//MARK: -- MainViewController: UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = getViewControllerByID("detailVC") as! DetailViewController
        navigationController?.show(vc, sender: self)
    }
}

