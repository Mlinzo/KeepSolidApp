//
//  ViewController.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/15/21.
//

import UIKit

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
    
    var menu = Menu(image: "partlycloudy", temp: "\(30)", date: "21.02.2021")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DailyView.imageView.image = UIImage(named: "partlycloudy")
        DailyView.tempLabel.text = String(format: "%@%@", "30", "\u{00B0}")
        lineShadow.image = UIImage(named:"line_shadow")
        dailyCollection.dataSource = self
        dailyCollection.register(UINib(nibName: "DailyCell", bundle: nil), forCellWithReuseIdentifier: "DailyCell")
        
    }
    @IBAction func settingsClick(_ sender: UIButton) {
    }
    
}
//MARK: - Extension: CollectionView
extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        for i in 1...7{
            menu.addDay(image: "partlycloudy", temp: "\(30+i)", date: "\(21+i).02.2021")
        }
        let cell = dailyCollection.dequeueReusableCell(withReuseIdentifier: "DailyCell", for: indexPath) as! DailyCell
        cell.setupCell(elems: menu.elements[indexPath.item])
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
