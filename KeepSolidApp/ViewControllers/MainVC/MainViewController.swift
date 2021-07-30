//
//  ViewController.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/15/21.
//

import UIKit
import RealmSwift
import CoreLocation

class MainViewController: UIViewController {

  
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var DailyView: DailyShortView!
    
    @IBOutlet weak var humidityValue: UILabel!
    @IBOutlet weak var humidityDesc: UILabel!
    
    @IBOutlet weak var uvindexValue: UILabel!
    @IBOutlet weak var uvindexDesc: UILabel!
    
    @IBOutlet weak var windValue: UILabel!
    @IBOutlet weak var windDesc: UILabel!
    
    @IBOutlet weak var dailyCollection: UICollectionView!
    @IBOutlet weak var collectionHeader: UILabel!
    
    @IBOutlet weak var unitsValue: UILabel!
    @IBOutlet weak var languageValue: UILabel!
    @IBOutlet weak var unitsView: UIView!
    @IBOutlet weak var languageView: UIView!
    
    @IBOutlet var mainViewController: UIView!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var settingsTitle: UILabel!
    
    @IBOutlet weak var upDoneButton: UIBarButtonItem!
    @IBOutlet weak var detailNavBar: UINavigationBar!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var detailPicker: UIPickerView!
    @IBOutlet weak var unitsLabel: UILabel!
    @IBOutlet weak var downDoneButton: UIBarButtonItem!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var skipButton: UIBarButtonItem!
    
    @IBOutlet weak var waitScreen: UIView!
    @IBOutlet weak var waitScreenLabel: UILabel!
    @IBOutlet weak var waitScreenIndicator: UIActivityIndicatorView!
    
    private var locationManager: CLLocationManager?
    
    let realm = try! Realm()
    var items: Results<MainModel>!
    
    var settingsOnScreen = false
    
    func changePositionOfSettingsView(direction: String, animationTime: TimeInterval){
        var yPosition = settingsView.frame.origin.y
        let xPosition = settingsView.frame.origin.x
        if(direction=="up") {
            settingsOnScreen = true
            yPosition -= 626
        } else if (direction=="down"){
            settingsOnScreen = false
            yPosition += 626
        }
        let width = settingsView.frame.size.width
        let height = settingsView.frame.size.height
        UIView.animate(withDuration: animationTime, animations: {
            self.settingsView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        })
    }
    
    func showPicker(_ show: Bool){
        detailPicker.isHidden = !show
        detailNavBar.isHidden = !show
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(realm.configuration.fileURL!)
        items = realm.objects(MainModel.self)
        if UserSettings.defaultLanguage == nil {
            UserSettings.defaultLanguage = "English"
        }
        if UserSettings.defaultUnits == nil {
            UserSettings.defaultUnits = LocalisedData.shared.defLang?.settingsPickerUnitTitle[1]
        }
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
        
        changePositionOfSettingsView(direction: "down", animationTime: 0)
        dailyCollection.register(UINib(nibName: "DailyCell", bundle: nil), forCellWithReuseIdentifier: "DailyCell")
        dailyCollection.dataSource = self
        dailyCollection.delegate = self
        detailPicker.dataSource = self
        detailPicker.delegate = self
        
        
        waitScreen.isHidden = false
        waitScreenIndicator.isHidden = true
        waitScreenLabel.text = "Location not allowed"
        
        if items.count != 0 {
            setupMainViewController(self)
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
    
    @IBAction func settingsClick(_ sender: UIButton) {
        if(settingsOnScreen == false){
            changePositionOfSettingsView(direction: "up", animationTime: 0.5)
        }
    }
  
    @IBAction func settingsUpDoneClick(_ sender: Any) {
        changePositionOfSettingsView(direction: "down", animationTime: 0.5)
        UserSettings.defaultLanguage = languageValue.text
        UserSettings.defaultUnits = unitsValue.text
        waitScreen.isHidden = false
        if let lon = NetworkManager.shared.lon, let lat = NetworkManager.shared.lat{
            NetworkManager.shared.getData( sender: self)
        }

    }
    
    @IBAction func settingsCancelClick(_ sender: Any) {
        changePositionOfSettingsView(direction: "down", animationTime: 0.5)
    }
    
    var pickerTitle: Array<String> = []
    var currentPicker: String?
    var currentPickerRow: Int?

    @IBAction func unitsClicked(_ sender: Any){
        pickerTitle = LocalisedData.shared.defLang!.settingsPickerUnitTitle
        detailPicker.reloadAllComponents()
        currentPicker = "units"
        showPicker(true)
    }
    
    @IBAction func languageClicked(_ sender: Any) {
        pickerTitle = LocalisedData.shared.defLang!.settingsPickerLanguageTitle
        detailPicker.reloadAllComponents()
        currentPicker = "language"
        showPicker(true)
    }
    
    @IBAction func pickerSkipClicked(_ sender: Any) {
        showPicker(false)
    }
    
    @IBAction func pickerDoneClicked(_ sender: Any) {
        switch currentPicker {
        case "units":
            unitsValue.text = pickerTitle[currentPickerRow ?? 0]
        case "language":
            languageValue.text = pickerTitle[currentPickerRow ?? 0]
        default:
            break
        }
        showPicker(false)
    }
    
}
//MARK: - MainViewController: UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let weekDate = getWeek(locale: UserSettings.dateLocale ?? "en_EN")

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
        let weekDate = getWeek(locale: UserSettings.dateLocale ?? "en_EN")
        let vc = getViewControllerByID("detailVC") as! DetailViewController
        vc.dayIndex = indexPath.item
        vc.day = weekDate[indexPath.item]
        navigationController?.show(vc, sender: self)
        
    }
}
//MARK: -- MainViewController: UIPickerViewDataSource
extension MainViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerTitle.count
    }
}
//MARK: -- MainViewController: UIPickerViewDelegate
extension MainViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerTitle[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentPickerRow = row
    }
}
//MARK: -- ViewController: CLLocationManagerDelegate
extension MainViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last {
            let lat = String(format: "%.4f", loc.coordinate.latitude)
            let lon = String(format: "%.4f", loc.coordinate.longitude)
            NetworkManager.shared.lon = lon
            NetworkManager.shared.lat = lat
            print(lon, lat)
            if let lo = NetworkManager.shared.lon, let la = NetworkManager.shared.lat{
                NetworkManager.shared.getData( sender: self)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
