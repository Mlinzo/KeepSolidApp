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
    
    @IBOutlet weak var isDownConstraint: NSLayoutConstraint!
    @IBOutlet weak var downConstraint: NSLayoutConstraint!
    var locationManager: CLLocationManager?
    
    let realm = try! Realm()
    var items: Results<MainModel>!
    
    var settingsOnScreen: Bool!
    
    var pickerTitle: Array<String> = []
    var currentPicker: String?
    var currentPickerRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
        configureMainViewController()
    }
}
