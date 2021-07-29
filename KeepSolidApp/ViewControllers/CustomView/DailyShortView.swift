//
//  CustomView.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/17/21.
//

import UIKit

class DailyShortView: UIView{
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var deskLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("DailyShortView", owner: self, options: nil)
        addSubview(mainView)
        mainView.frame = self.bounds
        mainView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    func setupView(desc: String, temp: Float, image: String) -> Void {
        let url = URL(string: "http://openweathermap.org/img/w/\(image).png")
        self.imageView.load(url: url!)
        self.tempLabel.text = String(format: "%.0f%@", temp, "\u{00B0}")
        self.deskLabel.text = String(format: "| %@", desc)
    }
}
