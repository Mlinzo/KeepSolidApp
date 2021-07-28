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
    
    @IBOutlet weak var unitsValue: UILabel!
    @IBOutlet weak var languageValue: UILabel!
    @IBOutlet weak var unitsView: UIView!
    @IBOutlet weak var languageView: UIView!
    
    @IBOutlet var mainViewController: UIView!
    @IBOutlet weak var settingsView: UIView!

    @IBOutlet weak var detailNavBar: UINavigationBar!
    @IBOutlet weak var detailPicker: UIPickerView!
    
    @IBOutlet weak var waitScreen: UIView!
    
    let realm = try! Realm()
    var items: Results<MainModel>!
    
    override func loadView() {
        super.loadView()
        let apiurl = "https://api.openweathermap.org/data/2.5/onecall?lat=46.4775&lon=30.7326&units=metric&lang=en&exclude=hourly,minutely&appid=0ef853635aef314bc8966ae105fa06fd"
        getData(from: apiurl, sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        items = realm.objects(MainModel.self)
        
        let xPosition = settingsView.frame.origin.x
        let yPosition = settingsView.frame.origin.y + 600
        let width = settingsView.frame.size.width
        let height = settingsView.frame.size.height
        UIView.animate(withDuration: 0, animations: {
            self.settingsView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        })
        
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
        dailyCollection.register(UINib(nibName: "DailyCell", bundle: nil), forCellWithReuseIdentifier: "DailyCell")
        dailyCollection.dataSource = self
        dailyCollection.delegate = self
        if items.count != 0 {
            setupViewController(self)

//            humidityValue.text = String(format: "%d%%", items[0].current!.humidity)
//            uvindexValue.text = String(format: "%0.0f", items[0].current!.uvIndex)
//            windValue.text = String(format: "%d kmh", items[0].current!.windSpeed)
//            lineShadow.image = UIImage(named:"line_shadow")
//            DailyView.setupView(desc: items[0].current!.weatherDesc , temp: items[0].current!.temp, image: items[0].current!.weatherIcon)
//            todayLabel.text = todayString()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    var settingsOnScreen = false
    
    func upSettingsView(){
        settingsOnScreen = true
        let xPosition = settingsView.frame.origin.x
        let yPosition = settingsView.frame.origin.y - 600 // Slide Up - Xpx

        let width = settingsView.frame.size.width
        let height = settingsView.frame.size.height

        UIView.animate(withDuration: 0.5, animations: {
            self.settingsView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        })
    }
    func downSettingsView() {
        settingsOnScreen = false
        let xPosition = settingsView.frame.origin.x
        let yPosition = settingsView.frame.origin.y + 600 // Slide Up - Xpx

        let width = settingsView.frame.size.width
        let height = settingsView.frame.size.height

        UIView.animate(withDuration: 0.5, animations: {
            self.settingsView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        })
    }
    
    @IBAction func settingsClick(_ sender: UIButton) {
        if(settingsOnScreen == false){
            upSettingsView()
        }
    }
  
    @IBAction func settingsUpDoneClick(_ sender: Any) {
        downSettingsView()
    }
    
    @IBAction func settingsCancelClick(_ sender: Any) {
        downSettingsView()
    }
    
    
    @IBAction func unitsClicked(_ sender: Any) {
        detailPicker.isHidden = !detailPicker.isHidden
        detailNavBar.isHidden = !detailNavBar.isHidden
    }
    
    @IBAction func languageClicked(_ sender: Any) {
        detailPicker.isHidden = !detailPicker.isHidden
        detailNavBar.isHidden = !detailNavBar.isHidden
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
