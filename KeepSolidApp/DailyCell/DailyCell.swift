//
//  DailyCell.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/18/21.
//

import UIKit
import RealmSwift

class DailyCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setupCell(daily: DailyModel, date: String){
        self.imageView.image = UIImage(named: daily.weatherIcon)
        self.tempLabel.text = String(format: "%0.0f", daily.dayTemp)
        self.dateLabel.text = date
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
