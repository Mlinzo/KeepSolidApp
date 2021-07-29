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
    
    func setupCell(image: String, temp: Float, date: String){
        let url = URL(string: "http://openweathermap.org/img/w/\(image).png")
        self.imageView.load(url: url!)
        self.tempLabel.text = String(format: "%0.0f%@", temp,"\u{00B0}")
        self.dateLabel.text = date
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
