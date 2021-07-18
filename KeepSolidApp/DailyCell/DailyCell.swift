//
//  DailyCell.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/18/21.
//

import UIKit

class DailyCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setupCell(elems: Elements){
        self.imageView.image = elems.image
        self.tempLabel.text = elems.temp
        self.dateLabel.text = elems.date
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
