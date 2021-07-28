//
//  DetailCustomView.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/21/21.
//

import UIKit

class DetailCustomView: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempText: UILabel!
    @IBOutlet weak var tempValue: UILabel!
    @IBOutlet weak var feelsText: UILabel!
    @IBOutlet weak var feelsValue: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("DetailCustomView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    func setupView(feels: Float, temp: Float, backgroundImage: String) -> Void {
        self.background.image = UIImage(named: backgroundImage)
        self.tempValue.text = String(format: "%0.0f%@", temp,"\u{00B0}")
        self.feelsValue.text = String(format: "%0.0f%@", feels,"\u{00B0}")
    }
}


