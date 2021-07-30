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
    @IBOutlet weak var detailNavBar: UINavigationItem!
    @IBOutlet weak var detailBackButon: UIBarButtonItem!
    
    var dayIndex: Int?
    var day: String?
    
    let realm = try! Realm()
    var items: Results<MainModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupDetViewController(self)
        }
    
    @IBAction func backClick(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
