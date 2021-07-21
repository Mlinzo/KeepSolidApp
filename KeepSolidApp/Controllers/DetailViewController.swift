//
//  DetailViewController.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/20/21.
//

import UIKit

//protocol DetailDataSource {
//    func getString() -> String
//}

class DetailViewController: UIViewController {
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var dailyView: DailyShortView!
    @IBOutlet weak var morningView: DetailCustomView!
    @IBOutlet weak var afternoonView: DetailCustomView!
    @IBOutlet weak var eveningView: DetailCustomView!
    @IBOutlet weak var nightView: DetailCustomView!
    
    
    var data: Elements?

//    var dataSource: DetailDataSource?
//    var setString: (() -> String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let today =  DateFormatter()
        today.dateStyle = .medium
        today.timeStyle = .none
        headLabel.text = today.string(from: Date())
    }

}
